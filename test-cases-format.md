## Test Cases
To store test-cases a CSV format is used. First N - 1 columns represent a function's arguments, last column represents a function's return value.

For example for the following function:
```javascript
function sum(int a, int b) {
   return a + b;
}
```

These test cases can be built.
| int | int | int |
| --- | --- | --- |
| 1   | 2   | 3   |  
| 2   | 2   | 4   |  

## Test Cases Header

### Header Type Mappings

| Type            | Java   | Python |
| --------------- | ------ | ------ |
| `int`           | int    | int    |
| `long`          | long   | int    |
| `float`         | float  | float  |
| `string`        | String | str    |
| `bool`          | bool   | bool   |
| `void`          | void   |        |
| `list`          | List   | List   |
| `array`         | []     | List   |
| `map`           | Map    | Dict   |
| `object`        | class  | class  |

### Parameter Type Expression Structure

#### Simple type declaration
`Parameter-Type`[`Parameter-Name`]
note: `Parameter-Name` is optional

Example:
`int[i]`

Java
```java
void foo(int i) {
}
```
Python
```python
def foo(i: int):
   pass
```

#### Array/List type declaration
list|array(`Inner-Type`)[`Parameter-Name`]
note: `Parameter-Name` is optional

Example:
`array(int)[arr]`

Java
```java
void foo(int[] arr) {
}
```
Python
```python
def foo(arr: List[int]):
   pass
```

#### Object type declaration
object(`Inner-Type-1`[`Parameter-Type-1`], `Inner-Type-2`[`Parameter-Type-2`], ...)<`Object-Type`>
note: `Parameter-Name-X` is optional

Example:
`object(array(int)[arr], float[b], object(int[a], String[b])<SubType>[sub])<MainType>[main]`

Java
```java
public class MainType {
   public static class SubType {
      public int a;
      public String b;
      public SubType(int a, String b) {
         this.a = a;
         this.b = b;
      }
   }
   public int[] arr;
   public SubType sub;
   public MainType(int[] arr, SubType sub) {
      this.arr = arr;
      this.sub = sub;
   }
}

void foo(MainType main) {
}
```

Python
```python
class MainType:
   class SubType:
      def __init__(self, a: int, b: str):
         self.a = a
         self.b = b
   def __init__(self, arr: List[int], sub: SubType):
      self.arr = arr
      self.sub = sub
```

## Test Cases Values
Every row of CSV body represents one test case. In every column of every row value for a particular parameter is stored. Values of container types such as lists, maps, arrays, objects are stored in JSON arrays.

Examples:
- `array[string]` -> `['a', 'b', 'c', 'd']`
- `object(int, string)` -> `[1, 'a']`
- `map(int, string)` -> `[[1, 'a'], [2, 'b']]`
