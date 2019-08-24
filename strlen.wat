(module
  (type $t0 (func (param i32) (result i32)))
  (type $t1 (func (param i32 i32) (result i32)))
  (import "env" "__linear_memory" (memory $env.__linear_memory 0))
  (import "env" "__indirect_function_table" (table $env.__indirect_function_table 0 funcref))
  (func $f0 (type $t0) (param $p0 i32) (result i32)
    (local $l1 i32)
    i32.const 0
    local.set $l1
    block $B0
      loop $L1
        local.get $p0
        i32.load8_u
        i32.eqz
        br_if $B0
        local.get $p0
        i32.const 1
        i32.add
        local.set $p0
        local.get $l1
        i32.const 1
        i32.add
        local.set $l1
        br $L1
      end
    end
    local.get $l1)
  (func $f1 (type $t1) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p1
    i32.load
    call $f0))
