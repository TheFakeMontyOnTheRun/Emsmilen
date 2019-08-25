(module
  (type $type0 (func (param i32) (result i32)))
  (type $type1 (func (param i32 i32) (result i32)))
  (import $import0 "env" "putchar"  (param i32) (result i32))
  (import $import1 "env" "puts"  (param i32) (result i32))
  (import $import2 "env" "strlen"  (param i32) (result i32))
  (table 0 anyfunc)
  (memory 1)
  (export "memory" memory)
  (export "testFunction" $func3)
  (export "main" $func4)
  (func $func3 (param $var0 i32) (result i32)
    (local $var1 i32) (local $var2 i32)
    get_local $var0
    call $import2
    set_local $var1
    i32.const 16
    call $import1
    drop
    block $label0
      get_local $var1
      i32.const 1
      i32.lt_s
      br_if $label0
      get_local $var1
      set_local $var2
      loop $label1
        get_local $var0
        i32.load8_s
        call $import0
        drop
        i32.const 46
        call $import0
        drop
        get_local $var0
        i32.const 1
        i32.add
        set_local $var0
        get_local $var2
        i32.const -1
        i32.add
        tee_local $var2
        br_if $label1
      end $label1
    end $label0
    get_local $var1
  )
  (func $func4 (param $var0 i32) (param $var1 i32) (result i32)
    i32.const 48
    call $func3
  )
  (data (i32.const 16)
    "I am the big pill\00"
  )
  (data (i32.const 48)
    "farofinha\00"
  )
)