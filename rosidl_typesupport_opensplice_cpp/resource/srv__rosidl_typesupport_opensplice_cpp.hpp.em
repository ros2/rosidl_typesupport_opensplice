// generated from
// rosidl_typesupport_opensplice_cpp/resource/srv__rosidl_typesupport_opensplice_cpp.hpp.em
// generated code does not contain a copyright notice

@# Included from rosidl_typesupport_fastrtps_cpp/resource/idl__rosidl_typesupport_opensplice_cpp.hpp.em
@{
from rosidl_cmake import convert_camel_case_to_lower_case_underscore
include_parts = [package_name] + list(interface_path.parents[0].parts)
include_dir = '/'.join(include_parts)
include_parts.append(convert_camel_case_to_lower_case_underscore(interface_path.stem))
}@
@{
include_base = '/'.join(include_parts)
header_files = [
    include_base +'__struct.hpp',
    include_dir + '/dds_opensplice/ccpp_' + interface_path.stem + '_.h',
    'rosidl_typesupport_cpp/service_type_support.hpp',
    'rosidl_typesupport_interface/macros.h',
    package_name + '/msg/rosidl_typesupport_opensplice_cpp__visibility_control.h',
]
}@
@[for header_file in header_files]@
@[    if header_file in include_directives]@
// already included above
// @
@[    else]@
@{include_directives.add(header_file)}@
@[    end if]@
#include "@(header_file)"
@[end for]@

@[for ns in service.structure_type.namespaces]@
namespace @(ns)
{
@[end for]@
namespace typesupport_opensplice_cpp
{
@{
__ros_msg_pkg_prefix = '::'.join(service.structure_type.namespaces)
__dds_msg_pkg_prefix = __ros_msg_pkg_prefix + '::dds_'
}@

@[for message in (service.request_message, service.response_message)]@
ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_PUBLIC_@(package_name)
extern void convert_ros_message_to_dds(
  const @(__ros_msg_pkg_prefix)::@(message.structure.type.name) & ros_message,
  @(__dds_msg_pkg_prefix)::@(message.structure.type.name)_ & dds_message);

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_PUBLIC_@(package_name)
extern void convert_dds_message_to_ros(
  const @(__dds_msg_pkg_prefix)::@(message.structure.type.name)_ & dds_message,
  @(__ros_msg_pkg_prefix)::@(message.structure.type.name) & ros_message);
@[end for]@

}  // namespace typesupport_opensplice_cpp

@[for ns in reversed(service.structure_type.namespaces)]@
}  // namespace @(ns)
@[end for]@

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_PUBLIC_@(package_name)
const rosidl_service_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__SERVICE_SYMBOL_NAME(
  rosidl_typesupport_opensplice_cpp,
  @(', '.join(service.structure_type.namespaces)),
  @(service.structure_type.name))();

#ifdef __cplusplus
}
#endif
