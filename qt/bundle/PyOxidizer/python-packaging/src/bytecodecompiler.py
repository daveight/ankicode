# Copyright 2022 Gregory Szorc.
#
# Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
# https://www.apache.org/licenses/LICENSE-2.0> or the MIT license
# <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your
# option. This file may not be copied, modified, or distributed
# except according to those terms.

# This script is executed to compile Python bytecode by the repackager.
#
# When invoked, we start a server that listens for commands. We then
# react to those commands and send results to the caller.

import importlib._bootstrap_external
import importlib.util
import marshal
import os
import re
import sys


RE_CODING = re.compile(b"^[ \t\f]*#.*?coding[:=][ \t]*([-_.a-zA-Z0-9]+)")


if marshal.version != 4:
    raise Exception("unexpected marshal version: %d" % marshal.version)

stdin = sys.__stdin__.buffer
stdout = sys.__stdout__.buffer


while True:
    command = stdin.readline().rstrip()

    if command == b"exit":
        sys.exit(0)
    elif command == b"magic_number":
        stdout.write(importlib._bootstrap_external.MAGIC_NUMBER)
        stdout.flush()
    elif command == b"compile":
        try:
            name_len = stdin.readline().rstrip()
            source_len = stdin.readline().rstrip()
            optimize_level = stdin.readline().rstrip()
            output_mode = stdin.readline().rstrip()

            name_len = int(name_len)
            source_len = int(source_len)
            optimize_level = int(optimize_level)

            name = stdin.read(name_len)
            source = stdin.read(source_len)

            name = os.fsdecode(name)

            # Default source encoding is UTF-8. But per PEP 263, the first or second
            # line of source can match a regular expression to define a custom
            # encoding. We need to detect custom encodings and use it to decode
            # the passed bytes to str.
            encoding = "utf-8"

            for line in source.splitlines()[0:2]:
                m = RE_CODING.match(line)
                if m:
                    encoding = m.group(1).decode("ascii")
                    break

            # Someone has set us up the BOM! According to PEP 263 the file should
            # be interpreted as UTF-8.
            if source.startswith(b"\xef\xbb\xbf"):
                encoding = "utf-8"
                source = source[3:]

            source_bytes = source
            source = source.decode(encoding)

            code = compile(source, name, "exec", optimize=optimize_level)
            bytecode = marshal.dumps(code)

            if output_mode == b"bytecode":
                out = bytecode
            elif output_mode == b"pyc-checked-hash":
                source_hash = importlib.util.source_hash(source_bytes)
                out = importlib._bootstrap_external._code_to_hash_pyc(
                    code,
                    source_hash,
                    checked=True,
                )
            elif output_mode == b"pyc-unchecked-hash":
                source_hash = importlib.util.source_hash(source_bytes)
                out = importlib._bootstrap_external._code_to_hash_pyc(
                    code,
                    source_hash,
                    checked=False,
                )
            else:
                raise Exception("unknown output mode: %s" % output_mode)

            # Code 0 means success.
            stdout.write(b"0\n")
            stdout.write(b"%d\n" % len(out))
            stdout.write(out)
        except Exception as e:
            stdout.write(b"1\n")
            error_bytes = str(e).encode("utf-8", errors="replace")
            stdout.write(b"%d\n" % len(error_bytes))
            stdout.write(error_bytes)

        stdout.flush()
    else:
        raise Exception("invalid command: %s" % command)
