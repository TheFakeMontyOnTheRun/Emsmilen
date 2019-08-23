(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (import "env" "__linear_memory" (memory (;0;) 0))
  (import "env" "__indirect_function_table" (table (;0;) 0 funcref))
  (func (;0;) (type 0) (param i32 i32) (result i32)
    local.get 1
    i32.load
    i32.load8_s
    local.get 0
    i32.add))
