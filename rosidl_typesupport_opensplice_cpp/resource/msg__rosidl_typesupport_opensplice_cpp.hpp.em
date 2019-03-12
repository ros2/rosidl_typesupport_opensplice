// generated from
// rosidl_typesupport_opensplice_cpp/resource/msg__rosidl_typesupport_opensplice_cpp.hpp.em
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
    'rosidl_generator_c/message_type_support_struct.h',
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

namespace DDS
{
class DomainParticipant;
class DataReader;
class DataWriter;
}  // namespace DDS

@[for ns in message.structure.type.namespaces]@
namespace @(ns)
{
@[end for]@
namespace typesupport_opensplice_cpp
{

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_PUBLIC_@(package_name)
extern void register_type__@(message.structure.type.name)(
  DDS::DomainParticipant * participant,
  const char * type_name);

@{
__ros_msg_pkg_prefix = '::'.join(message.structure.type.namespaces)
__ros_msg_type_prefix = __ros_msg_pkg_prefix + '::' + message.structure.type.name
__dds_msg_type_prefix = __ros_msg_pkg_prefix + '::dds_::' + message.structure.type.name + '_'
}@
ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_PUBLIC_@(package_name)
extern void convert_ros_message_to_dds(
  const @(__ros_msg_type_prefix) & ros_message,
  @(__dds_msg_type_prefix) & dds_message);

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_PUBLIC_@(package_name)
extern void publish__@(message.structure.type.name)(
  DDS::DataWriter * topic_writer,
  const void * untyped_ros_message);

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_PUBLIC_@(package_name)
extern void convert_dds_message_to_ros(
  const @(__dds_msg_type_prefix) & dds_message,
  @(__ros_msg_type_prefix) & ros_message);

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_PUBLIC_@(package_name)
extern bool take__@(message.structure.type.name)(
  DDS::DataReader * topic_reader,
  bool ignore_local_publications,
  void * untyped_ros_message,
  bool * taken);

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
const char *
serialize__@(message.structure.type.name)(
  const void * untyped_ros_message,
  void * serialized_data);

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
const char *
deserialize__@(message.structure.type.name)(
  const uint8_t * buffer,
  unsigned length,
  void * untyped_ros_message);

}  // namespace typesupport_opensplice_cpp

@[for ns in reversed(message.structure.type.namespaces)]@
}  // namespace @(ns)
@[end for]@

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_PUBLIC_@(package_name)
const rosidl_message_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
  rosidl_typesupport_opensplice_cpp,
  @(', '.join([package_name] + list(interface_path.parents[0].parts))),
  @(message.structure.type.name))();

#ifdef __cplusplus
}
#endif
