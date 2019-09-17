(module
  (type $t0 (func (param i32) (result i32)))
  (type $t1 (func (param i32 i32) (result i32)))
  (import "env" "strlen" (func $env.strlen (type $t0)))
  (import "env" "puts" (func $env.puts (type $t0)))
  (import "env" "putchar" (func $env.putchar (type $t0)))
  (import "env" "__linear_memory" (memory $env.__linear_memory 1))
  (import "env" "__indirect_function_table" (table $env.__indirect_function_table 0 funcref))
  (func $f3 (type $t0) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32) (local $l14 i32) (local $l15 i32) (local $l16 i32) (local $l17 i32)
    local.get $p0
    local.set $l3
    local.get $l3
    call $env.strlen
    local.set $l4
    local.get $l4
    local.set $l1
    i32.const 0
    call $env.puts
    local.set $l5
    i32.const 0
    local.set $l2
    loop $L0
      block $B1
        local.get $l2
        local.set $l6
        local.get $l1
        local.set $l7
        local.get $l6
        local.get $l7
        i32.lt_s
        local.set $l8
        local.get $l8
        br_if $B1
        local.get $l1
        local.set $l9
        local.get $l9
        return
      end
      local.get $p0
      local.set $l10
      local.get $l2
      local.set $l11
      local.get $l10
      local.get $l11
      i32.add
      local.set $l12
      local.get $l12
      i32.load8_s
      local.set $l13
      local.get $l13
      call $env.putchar
      local.set $l14
      i32.const 46
      call $env.putchar
      local.set $l15
      local.get $l2
      local.set $l16
      local.get $l16
      i32.const 1
      i32.add
      local.set $l17
      local.get $l17
      local.set $l2
      br $L0
      unreachable
    end
    unreachable)
  (func $f4 (type $t1) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32)
    i32.const 18
    call $f3
    local.set $l2
    local.get $l2
    return)
  (global $g0 (mut i32) (i32.const 0))
  (data $d0 (i32.const 0) "I am the big pill\00")
  (data $d1 (i32.const 18) "farofinha\00"))
