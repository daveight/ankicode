#include "json.h"
#include <string.h>

#define EMPTY_STRING(str) (*str == '\0')
#define SKIP_WHITE_SPACE(str) { const char *next = json::parsing::tlws(str); str = next; }

const char* json::parsing::tlws(const char *input)
{
    const char *output = input;
    while(!EMPTY_STRING(output) && std::isspace(*output)) output++;
    return output;
}

json::jtype::jtype json::jtype::detect(const char *input)
{
    const char *start = json::parsing::tlws(input);
    if (EMPTY_STRING(start)) return json::jtype::not_valid;
    switch (*start)
    {
        case '[':
            return json::jtype::jarray;
            break;
        case '"':
            return json::jtype::jstring;
            break;
        case '{':
            return json::jtype::jobject;
            break;
        case '-':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            return json::jtype::jnumber;
        case 't':
        case 'f':
            return (strncmp(start, "true", 4) == 0 || strncmp(start, "false", 5) == 0) ? json::jtype::jbool : json::jtype::not_valid;
            break;
        case 'n':
            return (strncmp(start, "null", 4) == 0) ? json::jtype::jnull : json::jtype::not_valid;
            break;
        default:
            return json::jtype::not_valid;
            break;
    }
}

std::string json::parsing::read_digits(const char *input)
{
    // Trim leading white space
    const char *index = json::parsing::tlws(input);

    // Initialize the result
    std::string result;

    // Loop until all digits are read
    while (
            !EMPTY_STRING(index) &&
            (
                    *index == '0' ||
                    *index == '1' ||
                    *index == '2' ||
                    *index == '3' ||
                    *index == '4' ||
                    *index == '5' ||
                    *index == '6' ||
                    *index == '7' ||
                    *index == '8' ||
                    *index == '9'
            )
            )
    {
        result += *index;
        index++;
    }

    // Return the result
    return result;
}

std::string json::parsing::escape_quotes(const char *input)
{
    std::string parsed;
    const size_t len = strlen(input);
    for (size_t i = 0; i < len; i++)
    {
        if (input[i] == '\"' && parsed[parsed.size() - 1] != '\\')
        {
            parsed += '\\';
        }
        parsed += input[i];
    }
    return parsed;
}

std::string json::parsing::unescape_quotes(const char *input)
{
    std::string result;
    const char *index = input;
    while (!EMPTY_STRING(index))
    {
        if (strlen(index) > 1 && *index == '\\' && index[1] == '\"')
        {
            result += '\"';
            index += 2;
        }
        else
        {
            result.push_back(*index);
            index++;
        }
    }
    return result;
}

json::parsing::parse_results json::parsing::parse(const char *input)
{
    // Strip white space
    const char *index = json::parsing::tlws(input);

    // Validate input
    if (EMPTY_STRING(index)) throw json::parsing_error("Input was only whitespace");

    // Initialize the output
    json::parsing::parse_results result;

    // Detect the type
    result.type = json::jtype::detect(index);

    // Parse the values
    switch (result.type)
    {
        case json::jtype::jstring:
            // Validate the input
            if (*index != '"') throw json::parsing_error("Expected '\"' as first character");

            // Remove the opening quote
            index++;

            // Copy the string
            while (!EMPTY_STRING(index))
            {
                if (*index != '"' || (result.value.size() > 0 && result.value[result.value.size() - 1] == '\\'))
                {
                    result.value.push_back(*index);
                    index++;
                }
                else
                {
                    break;
                }
            }
            if (EMPTY_STRING(index) || *index != '"') result.type = json::jtype::not_valid;
            else index++;
            break;
        case json::jtype::jnumber:
        {
            const char error[] = "Input did not contain a valid number";

            if (*index == '-')
            {
                result.value.push_back('-');
                index++;
            }

            if (EMPTY_STRING(index)) throw json::parsing_error(error);

            // Read the whole digits
            std::string whole_digits = json::parsing::read_digits(index);

            // Validate the read
            if (whole_digits.length() == 0) throw json::parsing_error(error);

            // Tack on the value
            result.value += whole_digits;
            index += whole_digits.length();

            // Check for decimal number
            if (*index == '.')
            {
                result.value.push_back('.');
                index++;
                std::string decimal_digits = json::parsing::read_digits(index);

                if (decimal_digits.length() == 0) throw json::parsing_error(error);

                result.value += decimal_digits;
                index += decimal_digits.size();
            }

            // Check for exponential number
            if (*index == 'e' || *index == 'E')
            {
                result.value.push_back(*index);
                index++;

                if (EMPTY_STRING(index)) throw json::parsing_error(error);

                if (*index == '+' || *index == '-')
                {
                    result.value.push_back(*index);
                    index++;
                }

                if (EMPTY_STRING(index)) throw json::parsing_error(error);

                std::string exponential_digits = json::parsing::read_digits(index);

                if (exponential_digits.size() == 0) throw json::parsing_error(error);

                result.value += exponential_digits;
                index += exponential_digits.size();
            }
            break;
        }
        case json::jtype::jobject:
        {
            const char error[] = "Input did not contain a valid object";

            // The first character should be an open bracket
            if (*index != '{') throw json::parsing_error(error);
            result.value += '{';
            index++;
            SKIP_WHITE_SPACE(index);

            // Loop until the closing bracket is encountered
            while (!EMPTY_STRING(index) && *index != '}')
            {
                // Read the key
                json::parsing::parse_results key = json::parsing::parse(index);

                // Validate that the key is a string
                if (key.type != json::jtype::jstring) throw json::parsing_error(error);

                // Store the key
                result.value += "\"" + json::parsing::escape_quotes(key.value.c_str()) + "\"";
                index = json::parsing::tlws(key.remainder);

                // Look for the colon
                if (*index != ':') throw json::parsing_error(error);
                result.value.push_back(':');
                index++;

                // Get the value
                json::parsing::parse_results subvalue = json::parsing::parse(index);

                // Validate the value type
                if (subvalue.type == json::jtype::not_valid) throw json::parsing_error(error);

                // Store the value
                if (subvalue.type == json::jtype::jstring) result.value += "\"" + json::parsing::escape_quotes(subvalue.value.c_str()) + "\"";
                else result.value += subvalue.value;
                index = json::parsing::tlws(subvalue.remainder);

                // Validate format
                if (*index != ',' && *index != '}') throw json::parsing_error(error);

                // Check for next line
                if (*index == ',')
                {
                    result.value.push_back(',');
                    index++;
                }
            }
            if (*index != '}') throw json::parsing_error(error);
            result.value += '}';
            index++;
            break;
        }
        case json::jtype::jarray:
        {
            const char error[] = "Input did not contain a valid array";
            if (*index != '[') throw json::parsing_error(error);
            result.value += '[';
            index++;
            SKIP_WHITE_SPACE(index);
            if (EMPTY_STRING(index)) throw json::parsing_error(error);
            while (!EMPTY_STRING(index) && *index != ']')
            {
                json::parsing::parse_results array_value = json::parsing::parse(index);
                if (array_value.type == json::jtype::not_valid) throw json::parsing_error(error);
                if (array_value.type == json::jtype::jstring) result.value += "\"" + json::parsing::escape_quotes(array_value.value.c_str()) + "\"";
                else result.value += array_value.value;
                index = json::parsing::tlws(array_value.remainder);
                if (*index != ',' && *index != ']') throw json::parsing_error(error);
                if (*index == ',')
                {
                    result.value.push_back(',');
                    index++;
                }
            }
            if (*index != ']') throw json::parsing_error(error);
            result.value.push_back(']');
            index++;
            break;
        }
        case json::jtype::jbool:
        {
            if (strncmp(index, "true", 4) == 0)
            {
                result.value += "true";
                index += 4;
            }
            else if (strncmp(index, "false", 4) == 0)
            {
                result.value += "false";
                index += 5;
            }
            else
            {
                throw json::parsing_error("Input did not contain a valid boolean");
            }
            break;
        }
        case json::jtype::jnull:
        {
            if (strncmp(index, "null", 4) == 0)
            {
                result.value += "null";
                index+= 4;
            }
            else
            {
                throw json::parsing_error("Input did not contain a valid null");
            }
            break;
        }
        default:
            throw json::parsing_error("Input did not contain valid json");
            break;
    }

    result.remainder = index;
    return result;
}

std::vector<std::string> json::parsing::parse_array(const char *input)
{
    // Initalize the result
    std::vector<std::string> result;

    const char *index = json::parsing::tlws(input);
    if (*index != '[') throw json::parsing_error("Input was not an array");
    index++;
    SKIP_WHITE_SPACE(index);
    if (*index == ']')
    {
        return result;
    }
    const char error[] = "Input was not properly formated";
    while (!EMPTY_STRING(index))
    {
        SKIP_WHITE_SPACE(index);
        json::parsing::parse_results parse_results = json::parsing::parse(index);
        if (parse_results.type == json::jtype::not_valid) throw json::parsing_error(error);
        result.push_back(parse_results.value);
        index = json::parsing::tlws(parse_results.remainder);
        if (*index == ']') break;
        if (*index == ',') index++;
    }
    if (*index != ']') throw json::parsing_error(error);
    index++;
    return result;
}

void json::jobject::proxy::set_array(const std::vector<std::string> &values, const bool wrap)
{
    std::string value = "[";
    for (size_t i = 0; i < values.size(); i++)
    {
        if (wrap) value += "\"" + json::parsing::escape_quotes(values[i].c_str()) + "\",";
        else value += values[i] + ",";
    }
    if(values.size() > 0) value.erase(value.size() - 1, 1);
    value += "]";
    this->sink.set(key, value);
}

json::jobject json::jobject::parse(const char *input)
{
    const char error[] = "Input is not a valid object";
    const char *index = json::parsing::tlws(input);
    if (*index != '{') throw json::parsing_error(error);
    index++;
    SKIP_WHITE_SPACE(index);
    if (EMPTY_STRING(index)) throw json::parsing_error(error);
    json::jobject result;
    while (!EMPTY_STRING(index) && *index != '}')
    {
        // Get key
        kvp entry;
        json::parsing::parse_results key = json::parsing::parse(index);
        if (key.type != json::jtype::jstring || key.value == "") throw json::parsing_error(error);
        entry.first = key.value;
        index = key.remainder;

        // Get value
        SKIP_WHITE_SPACE(index);
        if (*index != ':') throw json::parsing_error(error);
        index++;
        SKIP_WHITE_SPACE(index);
        json::parsing::parse_results value = json::parsing::parse(index);
        if (value.type == json::jtype::not_valid) throw json::parsing_error(error);
        if (value.type == json::jtype::jstring) entry.second = "\"" + value.value + "\"";
        else entry.second = value.value;
        index = value.remainder;

        // Clean up
        SKIP_WHITE_SPACE(index);
        if (*index != ',' && *index != '}') throw json::parsing_error(error);
        if (*index == ',') index++;
        result += entry;

    }
    if (EMPTY_STRING(index) || *index != '}') throw json::parsing_error(error);
    index++;
    return result;
}

void json::jobject::set(const std::string &key, const std::string &value)
{
    for (size_t i = 0; i < this->size(); i++)
    {
        if (this->data.at(i).first == key)
        {
            this->data.at(i).second = value;
            return;
        }
    }
    kvp entry;
    entry.first = key;
    entry.second = value;
    this->data.push_back(entry);
}

void json::jobject::remove(const std::string &key)
{
    for (size_t i = 0; i < this->size(); i++)
    {
        if (this->data.at(i).first == key)
        {
            this->data.erase(this->data.begin() + i, this->data.begin() + i + 1);
        }
    }
}

json::jobject::operator std::string() const
{
    if (this->size() == 0) return "{}";
    std::string result = "{";
    for (size_t i = 0; i < this->size(); i++)
    {
        result += "\"" + this->data.at(i).first + "\":" + this->data.at(i).second + ",";
    }
    result.erase(result.size() - 1, 1);
    result += "}";
    return result;
}