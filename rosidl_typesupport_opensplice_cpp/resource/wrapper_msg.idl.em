@# Included from rosidl_generator_dds_idl/resource/idl.idl.em
@{
from rosidl_cmake import convert_camel_case_to_lower_case_underscore
wrapper_prefix = 'Sample'
wrapper_type = wrapper_prefix + '_' + message.structure.type.name
header_guard_parts = [package_name] + list(interface_path.parents[0].parts) + \
    [convert_camel_case_to_lower_case_underscore(wrapper_prefix)] + \
    [convert_camel_case_to_lower_case_underscore(interface_path.stem)] + \
    ['idl']
}@

#ifndef __@('__'.join(header_guard_parts))__
#define __@('__'.join(header_guard_parts))__

@[for ns in message.structure.type.namespaces]@
module @(ns) {

@[end for]@
module dds_ {

struct @(wrapper_type)_ {

unsigned long long client_guid_0_;
unsigned long long client_guid_1_;
long long sequence_number_;
@('::'.join(message.structure.type.namespaces))::dds_::@(message.structure.type.name)_ response_;

};

#pragma keylist @(wrapper_type)_

};  // module dds_

@[for ns in reversed(message.structure.type.namespaces)]@
};  // module @(ns) {

@[end for]@

#endif  // __@('__'.join(header_guard_parts))__
