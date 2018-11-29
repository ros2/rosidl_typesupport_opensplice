# Copyright 2018 Open Source Robotics Foundation, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import re


def convert_to_opensplice_idl(input_idl, output_basepath):
    """
    Convert a generic IDL file to a new IDL file compatible with OpenSplice.

    The new IDL file is created with the same base name as the input file.
    A file with the same name in the output path wil be overwritten.

    :param: input_idl The input IDL file.
    :param: output_basepath The output path where the new IDL file is written.
    """
    # For IDL files included as "package_name/subfolder/MyMessage.idl"
    # We want to replace "package_name/subfolder" with the output basepath
    subfolder_path = os.path.dirname(input_idl)
    subfolder = os.path.basename(subfolder_path)
    package = os.path.basename(os.path.dirname(subfolder_path))
    converted_package = os.path.basename(output_basepath)
    output_file_path = os.path.join(output_basepath, os.path.basename(input_idl))

    # Regexes for find and replace
    regex_substitutions = []
    # Replace unsupported types
    regex_substitutions.append((re.compile(r'([<>,\s])int8([<>,\s])'), r'\1octet\2'))
    regex_substitutions.append((re.compile(r'([<>,\s])uint8([<>,\s])'), r'\1octet\2'))
    regex_substitutions.append((re.compile(r'([<>,\s])int16([<>,\s])'), r'\1short\2'))
    regex_substitutions.append((re.compile(r'([<>,\s])uint16([<>,\s])'), r'\1unsigned short\2'))
    regex_substitutions.append((re.compile(r'([<>,\s])int32([<>,\s])'), r'\1long\2'))
    regex_substitutions.append((re.compile(r'([<>,\s])uint32([<>,\s])'), r'\1unsigned long\2'))
    regex_substitutions.append((re.compile(r'([<>,\s])int64([<>,\s])'), r'\1long long\2'))
    regex_substitutions.append((re.compile(r'([<>,\s])uint64([<>,\s])'), r'\1unsigned long long\2'))
    with open(output_file_path, 'w') as output_file:
        # Strip annotations
        lines_no_annotations = [line for line in open(input_idl) if not re.match(r'^\s+@', line)]
        for line in lines_no_annotations:
            # Replace any include paths to match the new output path
            line = line.replace(
                '#include "{}/{}/'.format(package, subfolder),
                '#include "')

            # Replace unsupported types
            for regex, substitution in regex_substitutions:
                line = regex.sub(substitution, line)

            output_file.write(line)
