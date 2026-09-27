; Preserve the bundled JavaScript highlights, then give calls a more
; specific scope so declarations and invocations can use different colors.
; inherits: ecma,_javascript

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (member_expression
    property: [(property_identifier) (private_property_identifier)] @function.method.call))
