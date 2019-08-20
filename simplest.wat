(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func (param i32)))
  (type (;5;) (func (param i32 i32)))
  (import "env" "sbrk" (func $sbrk (type 0)))
  (import "env" "abort" (func $abort (type 1)))
  (import "env" "memory" (memory (;0;) 256 256))
  (func $main (type 2) (param i32 i32) (result i32)
    local.get 1
    i32.load
    i32.load8_s
    local.get 0
    i32.add)
  (func $__errno_location (type 3) (result i32)
    i32.const 1024)
  (func $dlmalloc (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 12
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 244
            i32.le_u
            if  ;; label = @5
              i32.const 1028
              i32.load
              local.tee 6
              i32.const 16
              local.get 0
              i32.const 11
              i32.add
              i32.const -8
              i32.and
              local.get 0
              i32.const 11
              i32.lt_u
              select
              local.tee 7
              i32.const 3
              i32.shr_u
              local.tee 0
              i32.shr_u
              local.tee 1
              i32.const 3
              i32.and
              if  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.const -1
                  i32.xor
                  i32.const 1
                  i32.and
                  local.get 0
                  i32.add
                  local.tee 2
                  i32.const 3
                  i32.shl
                  local.tee 3
                  i32.const 1076
                  i32.add
                  i32.load
                  local.tee 1
                  i32.load offset=8
                  local.tee 0
                  local.get 3
                  i32.const 1068
                  i32.add
                  local.tee 3
                  i32.eq
                  if  ;; label = @8
                    i32.const 1028
                    local.get 6
                    i32.const -2
                    local.get 2
                    i32.rotl
                    i32.and
                    i32.store
                    br 1 (;@7;)
                  end
                  i32.const 1044
                  i32.load
                  local.get 0
                  i32.gt_u
                  br_if 4 (;@3;)
                  local.get 0
                  i32.load offset=12
                  local.get 1
                  i32.ne
                  br_if 4 (;@3;)
                  local.get 0
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 0
                  i32.store offset=8
                end
                local.get 1
                i32.const 8
                i32.add
                local.set 0
                local.get 1
                local.get 2
                i32.const 3
                i32.shl
                local.tee 2
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 1
                local.get 2
                i32.add
                local.tee 1
                local.get 1
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                br 5 (;@1;)
              end
              local.get 7
              i32.const 1036
              i32.load
              local.tee 9
              i32.le_u
              br_if 1 (;@4;)
              local.get 1
              if  ;; label = @6
                block  ;; label = @7
                  i32.const 2
                  local.get 0
                  i32.shl
                  local.tee 2
                  i32.const 0
                  local.get 2
                  i32.sub
                  i32.or
                  local.get 1
                  local.get 0
                  i32.shl
                  i32.and
                  local.tee 0
                  i32.const 0
                  local.get 0
                  i32.sub
                  i32.and
                  i32.const -1
                  i32.add
                  local.tee 0
                  local.get 0
                  i32.const 12
                  i32.shr_u
                  i32.const 16
                  i32.and
                  local.tee 0
                  i32.shr_u
                  local.tee 1
                  i32.const 5
                  i32.shr_u
                  i32.const 8
                  i32.and
                  local.tee 2
                  local.get 0
                  i32.or
                  local.get 1
                  local.get 2
                  i32.shr_u
                  local.tee 0
                  i32.const 2
                  i32.shr_u
                  i32.const 4
                  i32.and
                  local.tee 1
                  i32.or
                  local.get 0
                  local.get 1
                  i32.shr_u
                  local.tee 0
                  i32.const 1
                  i32.shr_u
                  i32.const 2
                  i32.and
                  local.tee 1
                  i32.or
                  local.get 0
                  local.get 1
                  i32.shr_u
                  local.tee 0
                  i32.const 1
                  i32.shr_u
                  i32.const 1
                  i32.and
                  local.tee 1
                  i32.or
                  local.get 0
                  local.get 1
                  i32.shr_u
                  i32.add
                  local.tee 2
                  i32.const 3
                  i32.shl
                  local.tee 3
                  i32.const 1076
                  i32.add
                  i32.load
                  local.tee 1
                  i32.load offset=8
                  local.tee 0
                  local.get 3
                  i32.const 1068
                  i32.add
                  local.tee 3
                  i32.eq
                  if  ;; label = @8
                    i32.const 1028
                    local.get 6
                    i32.const -2
                    local.get 2
                    i32.rotl
                    i32.and
                    local.tee 6
                    i32.store
                    br 1 (;@7;)
                  end
                  i32.const 1044
                  i32.load
                  local.get 0
                  i32.gt_u
                  br_if 4 (;@3;)
                  local.get 0
                  i32.load offset=12
                  local.get 1
                  i32.ne
                  br_if 4 (;@3;)
                  local.get 0
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 0
                  i32.store offset=8
                end
                local.get 1
                local.get 7
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 1
                local.get 7
                i32.add
                local.tee 5
                local.get 2
                i32.const 3
                i32.shl
                local.tee 0
                local.get 7
                i32.sub
                local.tee 3
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 0
                local.get 1
                i32.add
                local.get 3
                i32.store
                local.get 9
                if  ;; label = @7
                  local.get 9
                  i32.const 3
                  i32.shr_u
                  local.tee 4
                  i32.const 3
                  i32.shl
                  i32.const 1068
                  i32.add
                  local.set 0
                  i32.const 1048
                  i32.load
                  local.set 2
                  block  ;; label = @8
                    local.get 6
                    i32.const 1
                    local.get 4
                    i32.shl
                    local.tee 4
                    i32.and
                    i32.eqz
                    if  ;; label = @9
                      i32.const 1028
                      local.get 4
                      local.get 6
                      i32.or
                      i32.store
                      local.get 0
                      local.set 4
                      br 1 (;@8;)
                    end
                    i32.const 1044
                    i32.load
                    local.get 0
                    i32.load offset=8
                    local.tee 4
                    i32.gt_u
                    br_if 5 (;@3;)
                  end
                  local.get 0
                  local.get 2
                  i32.store offset=8
                  local.get 4
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 0
                  i32.store offset=12
                  local.get 2
                  local.get 4
                  i32.store offset=8
                end
                local.get 1
                i32.const 8
                i32.add
                local.set 0
                i32.const 1048
                local.get 5
                i32.store
                i32.const 1036
                local.get 3
                i32.store
                br 5 (;@1;)
              end
              i32.const 1032
              i32.load
              local.tee 10
              i32.eqz
              br_if 1 (;@4;)
              local.get 10
              i32.const 0
              local.get 10
              i32.sub
              i32.and
              i32.const -1
              i32.add
              local.tee 0
              local.get 0
              i32.const 12
              i32.shr_u
              i32.const 16
              i32.and
              local.tee 0
              i32.shr_u
              local.tee 1
              i32.const 5
              i32.shr_u
              i32.const 8
              i32.and
              local.tee 2
              local.get 0
              i32.or
              local.get 1
              local.get 2
              i32.shr_u
              local.tee 0
              i32.const 2
              i32.shr_u
              i32.const 4
              i32.and
              local.tee 1
              i32.or
              local.get 0
              local.get 1
              i32.shr_u
              local.tee 0
              i32.const 1
              i32.shr_u
              i32.const 2
              i32.and
              local.tee 1
              i32.or
              local.get 0
              local.get 1
              i32.shr_u
              local.tee 0
              i32.const 1
              i32.shr_u
              i32.const 1
              i32.and
              local.tee 1
              i32.or
              local.get 0
              local.get 1
              i32.shr_u
              i32.add
              i32.const 2
              i32.shl
              i32.const 1332
              i32.add
              i32.load
              local.tee 1
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 7
              i32.sub
              local.set 2
              local.get 1
              local.set 3
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load offset=16
                  local.tee 0
                  i32.eqz
                  if  ;; label = @8
                    local.get 3
                    i32.load offset=20
                    local.tee 0
                    i32.eqz
                    br_if 1 (;@7;)
                  end
                  local.get 0
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 7
                  i32.sub
                  local.tee 3
                  local.get 2
                  local.get 3
                  local.get 2
                  i32.lt_u
                  local.tee 3
                  select
                  local.set 2
                  local.get 0
                  local.get 1
                  local.get 3
                  select
                  local.set 1
                  local.get 0
                  local.set 3
                  br 1 (;@6;)
                end
              end
              i32.const 1044
              i32.load
              local.tee 13
              local.get 1
              i32.gt_u
              br_if 2 (;@3;)
              local.get 1
              local.get 7
              i32.add
              local.tee 11
              local.get 1
              i32.le_u
              br_if 2 (;@3;)
              local.get 1
              i32.load offset=24
              local.set 8
              block  ;; label = @6
                local.get 1
                local.get 1
                i32.load offset=12
                local.tee 4
                i32.ne
                if  ;; label = @7
                  local.get 13
                  local.get 1
                  i32.load offset=8
                  local.tee 0
                  i32.gt_u
                  br_if 4 (;@3;)
                  local.get 0
                  i32.load offset=12
                  local.get 1
                  i32.ne
                  br_if 4 (;@3;)
                  local.get 4
                  i32.load offset=8
                  local.get 1
                  i32.ne
                  br_if 4 (;@3;)
                  local.get 0
                  local.get 4
                  i32.store offset=12
                  local.get 4
                  local.get 0
                  i32.store offset=8
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 1
                  i32.const 20
                  i32.add
                  local.tee 3
                  i32.load
                  local.tee 0
                  i32.eqz
                  if  ;; label = @8
                    local.get 1
                    i32.load offset=16
                    local.tee 0
                    i32.eqz
                    br_if 1 (;@7;)
                    local.get 1
                    i32.const 16
                    i32.add
                    local.set 3
                  end
                  loop  ;; label = @8
                    local.get 3
                    local.set 5
                    local.get 0
                    local.tee 4
                    i32.const 20
                    i32.add
                    local.tee 3
                    i32.load
                    local.tee 0
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 16
                    i32.add
                    local.set 3
                    local.get 4
                    i32.load offset=16
                    local.tee 0
                    br_if 0 (;@8;)
                  end
                  local.get 13
                  local.get 5
                  i32.gt_u
                  br_if 4 (;@3;)
                  local.get 5
                  i32.const 0
                  i32.store
                  br 1 (;@6;)
                end
                i32.const 0
                local.set 4
              end
              block  ;; label = @6
                local.get 8
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 1
                  i32.load offset=28
                  local.tee 0
                  i32.const 2
                  i32.shl
                  i32.const 1332
                  i32.add
                  local.tee 3
                  i32.load
                  local.get 1
                  i32.eq
                  if  ;; label = @8
                    local.get 3
                    local.get 4
                    i32.store
                    local.get 4
                    br_if 1 (;@7;)
                    i32.const 1032
                    local.get 10
                    i32.const -2
                    local.get 0
                    i32.rotl
                    i32.and
                    i32.store
                    br 2 (;@6;)
                  end
                  i32.const 1044
                  i32.load
                  local.get 8
                  i32.gt_u
                  br_if 4 (;@3;)
                  local.get 8
                  i32.const 16
                  i32.const 20
                  local.get 8
                  i32.load offset=16
                  local.get 1
                  i32.eq
                  select
                  i32.add
                  local.get 4
                  i32.store
                  local.get 4
                  i32.eqz
                  br_if 1 (;@6;)
                end
                i32.const 1044
                i32.load
                local.tee 3
                local.get 4
                i32.gt_u
                br_if 3 (;@3;)
                local.get 4
                local.get 8
                i32.store offset=24
                local.get 1
                i32.load offset=16
                local.tee 0
                if  ;; label = @7
                  local.get 3
                  local.get 0
                  i32.gt_u
                  br_if 4 (;@3;)
                  local.get 4
                  local.get 0
                  i32.store offset=16
                  local.get 0
                  local.get 4
                  i32.store offset=24
                end
                local.get 1
                i32.load offset=20
                local.tee 0
                i32.eqz
                br_if 0 (;@6;)
                i32.const 1044
                i32.load
                local.get 0
                i32.gt_u
                br_if 3 (;@3;)
                local.get 4
                local.get 0
                i32.store offset=20
                local.get 0
                local.get 4
                i32.store offset=24
              end
              block  ;; label = @6
                local.get 2
                i32.const 15
                i32.le_u
                if  ;; label = @7
                  local.get 1
                  local.get 2
                  local.get 7
                  i32.add
                  local.tee 0
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 1
                  i32.add
                  local.tee 0
                  local.get 0
                  i32.load offset=4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  br 1 (;@6;)
                end
                local.get 1
                local.get 7
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 11
                local.get 2
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 2
                local.get 11
                i32.add
                local.get 2
                i32.store
                local.get 9
                if  ;; label = @7
                  local.get 9
                  i32.const 3
                  i32.shr_u
                  local.tee 4
                  i32.const 3
                  i32.shl
                  i32.const 1068
                  i32.add
                  local.set 0
                  i32.const 1048
                  i32.load
                  local.set 3
                  block  ;; label = @8
                    i32.const 1
                    local.get 4
                    i32.shl
                    local.tee 4
                    local.get 6
                    i32.and
                    i32.eqz
                    if  ;; label = @9
                      i32.const 1028
                      local.get 4
                      local.get 6
                      i32.or
                      i32.store
                      local.get 0
                      local.set 7
                      br 1 (;@8;)
                    end
                    i32.const 1044
                    i32.load
                    local.get 0
                    i32.load offset=8
                    local.tee 7
                    i32.gt_u
                    br_if 5 (;@3;)
                  end
                  local.get 0
                  local.get 3
                  i32.store offset=8
                  local.get 7
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 0
                  i32.store offset=12
                  local.get 3
                  local.get 7
                  i32.store offset=8
                end
                i32.const 1048
                local.get 11
                i32.store
                i32.const 1036
                local.get 2
                i32.store
              end
              local.get 1
              i32.const 8
              i32.add
              local.set 0
              br 4 (;@1;)
            end
            i32.const -1
            local.set 7
            local.get 0
            i32.const -65
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 11
            i32.add
            local.tee 0
            i32.const -8
            i32.and
            local.set 7
            i32.const 1032
            i32.load
            local.tee 8
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.get 7
            i32.sub
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block (result i32)  ;; label = @8
                    i32.const 0
                    local.get 0
                    i32.const 8
                    i32.shr_u
                    local.tee 0
                    i32.eqz
                    br_if 0 (;@8;)
                    drop
                    i32.const 31
                    local.get 7
                    i32.const 16777215
                    i32.gt_u
                    br_if 0 (;@8;)
                    drop
                    local.get 0
                    local.get 0
                    i32.const 1048320
                    i32.add
                    i32.const 16
                    i32.shr_u
                    i32.const 8
                    i32.and
                    local.tee 0
                    i32.shl
                    local.tee 1
                    local.get 1
                    i32.const 520192
                    i32.add
                    i32.const 16
                    i32.shr_u
                    i32.const 4
                    i32.and
                    local.tee 1
                    i32.shl
                    local.tee 2
                    local.get 2
                    i32.const 245760
                    i32.add
                    i32.const 16
                    i32.shr_u
                    i32.const 2
                    i32.and
                    local.tee 2
                    i32.shl
                    i32.const 15
                    i32.shr_u
                    local.get 0
                    local.get 1
                    i32.or
                    local.get 2
                    i32.or
                    i32.sub
                    local.tee 0
                    i32.const 1
                    i32.shl
                    local.get 7
                    local.get 0
                    i32.const 21
                    i32.add
                    i32.shr_u
                    i32.const 1
                    i32.and
                    i32.or
                    i32.const 28
                    i32.add
                  end
                  local.tee 5
                  i32.const 2
                  i32.shl
                  i32.const 1332
                  i32.add
                  i32.load
                  local.tee 2
                  i32.eqz
                  if  ;; label = @8
                    i32.const 0
                    local.set 0
                    br 1 (;@7;)
                  end
                  local.get 7
                  i32.const 0
                  i32.const 25
                  local.get 5
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get 5
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set 1
                  i32.const 0
                  local.set 0
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 2
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 7
                      i32.sub
                      local.tee 6
                      local.get 3
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 2
                      local.set 4
                      local.get 6
                      local.tee 3
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 3
                      local.get 2
                      local.set 0
                      br 3 (;@6;)
                    end
                    local.get 0
                    local.get 2
                    i32.load offset=20
                    local.tee 6
                    local.get 6
                    local.get 2
                    local.get 1
                    i32.const 29
                    i32.shr_u
                    i32.const 4
                    i32.and
                    i32.add
                    i32.load offset=16
                    local.tee 2
                    i32.eq
                    select
                    local.get 0
                    local.get 6
                    select
                    local.set 0
                    local.get 1
                    local.get 2
                    i32.const 0
                    i32.ne
                    i32.shl
                    local.set 1
                    local.get 2
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                local.get 4
                i32.or
                i32.eqz
                if  ;; label = @7
                  i32.const 2
                  local.get 5
                  i32.shl
                  local.tee 0
                  i32.const 0
                  local.get 0
                  i32.sub
                  i32.or
                  local.get 8
                  i32.and
                  local.tee 0
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 0
                  i32.const 0
                  local.get 0
                  i32.sub
                  i32.and
                  i32.const -1
                  i32.add
                  local.tee 0
                  local.get 0
                  i32.const 12
                  i32.shr_u
                  i32.const 16
                  i32.and
                  local.tee 0
                  i32.shr_u
                  local.tee 1
                  i32.const 5
                  i32.shr_u
                  i32.const 8
                  i32.and
                  local.tee 2
                  local.get 0
                  i32.or
                  local.get 1
                  local.get 2
                  i32.shr_u
                  local.tee 0
                  i32.const 2
                  i32.shr_u
                  i32.const 4
                  i32.and
                  local.tee 1
                  i32.or
                  local.get 0
                  local.get 1
                  i32.shr_u
                  local.tee 0
                  i32.const 1
                  i32.shr_u
                  i32.const 2
                  i32.and
                  local.tee 1
                  i32.or
                  local.get 0
                  local.get 1
                  i32.shr_u
                  local.tee 0
                  i32.const 1
                  i32.shr_u
                  i32.const 1
                  i32.and
                  local.tee 1
                  i32.or
                  local.get 0
                  local.get 1
                  i32.shr_u
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 1332
                  i32.add
                  i32.load
                  local.set 0
                end
                local.get 0
                i32.eqz
                br_if 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 0
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 7
                i32.sub
                local.tee 2
                local.get 3
                i32.lt_u
                local.set 1
                local.get 2
                local.get 3
                local.get 1
                select
                local.set 3
                local.get 0
                local.get 4
                local.get 1
                select
                local.set 4
                local.get 0
                i32.load offset=16
                local.tee 1
                if (result i32)  ;; label = @7
                  local.get 1
                else
                  local.get 0
                  i32.load offset=20
                end
                local.tee 0
                br_if 0 (;@6;)
              end
            end
            local.get 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.const 1036
            i32.load
            local.get 7
            i32.sub
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 1044
            i32.load
            local.tee 10
            local.get 4
            i32.gt_u
            br_if 1 (;@3;)
            local.get 4
            local.get 7
            i32.add
            local.tee 5
            local.get 4
            i32.le_u
            br_if 1 (;@3;)
            local.get 4
            i32.load offset=24
            local.set 9
            block  ;; label = @5
              local.get 4
              local.get 4
              i32.load offset=12
              local.tee 1
              i32.ne
              if  ;; label = @6
                local.get 10
                local.get 4
                i32.load offset=8
                local.tee 0
                i32.gt_u
                br_if 3 (;@3;)
                local.get 0
                i32.load offset=12
                local.get 4
                i32.ne
                br_if 3 (;@3;)
                local.get 1
                i32.load offset=8
                local.get 4
                i32.ne
                br_if 3 (;@3;)
                local.get 0
                local.get 1
                i32.store offset=12
                local.get 1
                local.get 0
                i32.store offset=8
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 4
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 0
                i32.eqz
                if  ;; label = @7
                  local.get 4
                  i32.load offset=16
                  local.tee 0
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 4
                  i32.const 16
                  i32.add
                  local.set 2
                end
                loop  ;; label = @7
                  local.get 2
                  local.set 6
                  local.get 0
                  local.tee 1
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 0
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 16
                  i32.add
                  local.set 2
                  local.get 1
                  i32.load offset=16
                  local.tee 0
                  br_if 0 (;@7;)
                end
                local.get 10
                local.get 6
                i32.gt_u
                br_if 3 (;@3;)
                local.get 6
                i32.const 0
                i32.store
                br 1 (;@5;)
              end
              i32.const 0
              local.set 1
            end
            block  ;; label = @5
              local.get 9
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 4
                i32.load offset=28
                local.tee 0
                i32.const 2
                i32.shl
                i32.const 1332
                i32.add
                local.tee 2
                i32.load
                local.get 4
                i32.eq
                if  ;; label = @7
                  local.get 2
                  local.get 1
                  i32.store
                  local.get 1
                  br_if 1 (;@6;)
                  i32.const 1032
                  local.get 8
                  i32.const -2
                  local.get 0
                  i32.rotl
                  i32.and
                  local.tee 8
                  i32.store
                  br 2 (;@5;)
                end
                i32.const 1044
                i32.load
                local.get 9
                i32.gt_u
                br_if 3 (;@3;)
                local.get 9
                i32.const 16
                i32.const 20
                local.get 9
                i32.load offset=16
                local.get 4
                i32.eq
                select
                i32.add
                local.get 1
                i32.store
                local.get 1
                i32.eqz
                br_if 1 (;@5;)
              end
              i32.const 1044
              i32.load
              local.tee 2
              local.get 1
              i32.gt_u
              br_if 2 (;@3;)
              local.get 1
              local.get 9
              i32.store offset=24
              local.get 4
              i32.load offset=16
              local.tee 0
              if  ;; label = @6
                local.get 2
                local.get 0
                i32.gt_u
                br_if 3 (;@3;)
                local.get 1
                local.get 0
                i32.store offset=16
                local.get 0
                local.get 1
                i32.store offset=24
              end
              local.get 4
              i32.load offset=20
              local.tee 0
              i32.eqz
              br_if 0 (;@5;)
              i32.const 1044
              i32.load
              local.get 0
              i32.gt_u
              br_if 2 (;@3;)
              local.get 1
              local.get 0
              i32.store offset=20
              local.get 0
              local.get 1
              i32.store offset=24
            end
            block  ;; label = @5
              local.get 3
              i32.const 15
              i32.le_u
              if  ;; label = @6
                local.get 4
                local.get 3
                local.get 7
                i32.add
                local.tee 0
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 0
                local.get 4
                i32.add
                local.tee 0
                local.get 0
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              local.get 4
              local.get 7
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 5
              local.get 3
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 3
              local.get 5
              i32.add
              local.get 3
              i32.store
              local.get 3
              i32.const 255
              i32.le_u
              if  ;; label = @6
                local.get 3
                i32.const 3
                i32.shr_u
                local.tee 1
                i32.const 3
                i32.shl
                i32.const 1068
                i32.add
                local.set 0
                block  ;; label = @7
                  i32.const 1028
                  i32.load
                  local.tee 2
                  i32.const 1
                  local.get 1
                  i32.shl
                  local.tee 1
                  i32.and
                  i32.eqz
                  if  ;; label = @8
                    i32.const 1028
                    local.get 1
                    local.get 2
                    i32.or
                    i32.store
                    local.get 0
                    local.set 2
                    br 1 (;@7;)
                  end
                  i32.const 1044
                  i32.load
                  local.get 0
                  i32.load offset=8
                  local.tee 2
                  i32.gt_u
                  br_if 4 (;@3;)
                end
                local.get 0
                local.get 5
                i32.store offset=8
                local.get 2
                local.get 5
                i32.store offset=12
                local.get 5
                local.get 0
                i32.store offset=12
                local.get 5
                local.get 2
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 5
              block (result i32)  ;; label = @6
                i32.const 0
                local.get 3
                i32.const 8
                i32.shr_u
                local.tee 0
                i32.eqz
                br_if 0 (;@6;)
                drop
                i32.const 31
                local.get 3
                i32.const 16777215
                i32.gt_u
                br_if 0 (;@6;)
                drop
                local.get 0
                local.get 0
                i32.const 1048320
                i32.add
                i32.const 16
                i32.shr_u
                i32.const 8
                i32.and
                local.tee 0
                i32.shl
                local.tee 1
                local.get 1
                i32.const 520192
                i32.add
                i32.const 16
                i32.shr_u
                i32.const 4
                i32.and
                local.tee 1
                i32.shl
                local.tee 2
                local.get 2
                i32.const 245760
                i32.add
                i32.const 16
                i32.shr_u
                i32.const 2
                i32.and
                local.tee 2
                i32.shl
                i32.const 15
                i32.shr_u
                local.get 0
                local.get 1
                i32.or
                local.get 2
                i32.or
                i32.sub
                local.tee 0
                i32.const 1
                i32.shl
                local.get 3
                local.get 0
                i32.const 21
                i32.add
                i32.shr_u
                i32.const 1
                i32.and
                i32.or
                i32.const 28
                i32.add
              end
              local.tee 0
              i32.store offset=28
              local.get 5
              i64.const 0
              i64.store offset=16 align=4
              local.get 0
              i32.const 2
              i32.shl
              i32.const 1332
              i32.add
              local.set 1
              block  ;; label = @6
                block  ;; label = @7
                  local.get 8
                  i32.const 1
                  local.get 0
                  i32.shl
                  local.tee 2
                  i32.and
                  i32.eqz
                  if  ;; label = @8
                    i32.const 1032
                    local.get 2
                    local.get 8
                    i32.or
                    i32.store
                    local.get 1
                    local.get 5
                    i32.store
                    br 1 (;@7;)
                  end
                  local.get 3
                  i32.const 0
                  i32.const 25
                  local.get 0
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get 0
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set 0
                  local.get 1
                  i32.load
                  local.set 7
                  loop  ;; label = @8
                    local.get 7
                    local.tee 1
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 3
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 0
                    i32.const 29
                    i32.shr_u
                    local.set 2
                    local.get 0
                    i32.const 1
                    i32.shl
                    local.set 0
                    local.get 1
                    local.get 2
                    i32.const 4
                    i32.and
                    i32.add
                    i32.const 16
                    i32.add
                    local.tee 2
                    i32.load
                    local.tee 7
                    br_if 0 (;@8;)
                  end
                  i32.const 1044
                  i32.load
                  local.get 2
                  i32.gt_u
                  br_if 4 (;@3;)
                  local.get 2
                  local.get 5
                  i32.store
                end
                local.get 5
                local.get 1
                i32.store offset=24
                local.get 5
                local.get 5
                i32.store offset=12
                local.get 5
                local.get 5
                i32.store offset=8
                br 1 (;@5;)
              end
              i32.const 1044
              i32.load
              local.tee 2
              local.get 1
              i32.load offset=8
              local.tee 0
              i32.gt_u
              local.get 2
              local.get 1
              i32.gt_u
              i32.or
              br_if 2 (;@3;)
              local.get 0
              local.get 5
              i32.store offset=12
              local.get 1
              local.get 5
              i32.store offset=8
              local.get 5
              i32.const 0
              i32.store offset=24
              local.get 5
              local.get 1
              i32.store offset=12
              local.get 5
              local.get 0
              i32.store offset=8
            end
            local.get 4
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          i32.const 1036
          i32.load
          local.tee 1
          local.get 7
          i32.ge_u
          if  ;; label = @4
            i32.const 1048
            i32.load
            local.set 0
            block  ;; label = @5
              local.get 1
              local.get 7
              i32.sub
              local.tee 2
              i32.const 16
              i32.ge_u
              if  ;; label = @6
                i32.const 1036
                local.get 2
                i32.store
                i32.const 1048
                local.get 0
                local.get 7
                i32.add
                local.tee 3
                i32.store
                local.get 3
                local.get 2
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 0
                local.get 1
                i32.add
                local.get 2
                i32.store
                local.get 0
                local.get 7
                i32.const 3
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              i32.const 1048
              i32.const 0
              i32.store
              i32.const 1036
              i32.const 0
              i32.store
              local.get 0
              local.get 1
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 1
              i32.add
              local.tee 1
              local.get 1
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
            end
            local.get 0
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          i32.const 1040
          i32.load
          local.tee 1
          local.get 7
          i32.gt_u
          if  ;; label = @4
            i32.const 1040
            local.get 1
            local.get 7
            i32.sub
            local.tee 1
            i32.store
            i32.const 1052
            i32.const 1052
            i32.load
            local.tee 0
            local.get 7
            i32.add
            local.tee 2
            i32.store
            local.get 2
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 7
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 0
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          i32.const 0
          local.set 0
          local.get 7
          i32.const 47
          i32.add
          local.tee 4
          block (result i32)  ;; label = @4
            i32.const 1500
            i32.load
            if  ;; label = @5
              i32.const 1508
              i32.load
              br 1 (;@4;)
            end
            i32.const 1512
            i64.const -1
            i64.store align=4
            i32.const 1504
            i64.const 17592186048512
            i64.store align=4
            i32.const 1500
            local.get 12
            i32.const 12
            i32.add
            i32.const -16
            i32.and
            i32.const 1431655768
            i32.xor
            i32.store
            i32.const 1520
            i32.const 0
            i32.store
            i32.const 1472
            i32.const 0
            i32.store
            i32.const 4096
          end
          local.tee 2
          i32.add
          local.tee 6
          i32.const 0
          local.get 2
          i32.sub
          local.tee 5
          i32.and
          local.tee 2
          local.get 7
          i32.le_u
          br_if 2 (;@1;)
          i32.const 1468
          i32.load
          local.tee 3
          if  ;; label = @4
            i32.const 1460
            i32.load
            local.tee 8
            local.get 2
            i32.add
            local.tee 9
            local.get 8
            i32.le_u
            local.get 9
            local.get 3
            i32.gt_u
            i32.or
            br_if 3 (;@1;)
          end
          block  ;; label = @4
            i32.const 1472
            i32.load8_u
            i32.const 4
            i32.and
            i32.eqz
            if  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 1052
                      i32.load
                      local.tee 3
                      if  ;; label = @10
                        i32.const 1476
                        local.set 0
                        loop  ;; label = @11
                          local.get 0
                          i32.load
                          local.tee 8
                          local.get 3
                          i32.le_u
                          if  ;; label = @12
                            local.get 8
                            local.get 0
                            i32.load offset=4
                            i32.add
                            local.get 3
                            i32.gt_u
                            br_if 3 (;@9;)
                          end
                          local.get 0
                          i32.load offset=8
                          local.tee 0
                          br_if 0 (;@11;)
                        end
                      end
                      i32.const 0
                      call $sbrk
                      local.tee 1
                      i32.const -1
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 2
                      local.set 6
                      i32.const 1504
                      i32.load
                      local.tee 0
                      i32.const -1
                      i32.add
                      local.tee 3
                      local.get 1
                      i32.and
                      if  ;; label = @10
                        local.get 2
                        local.get 1
                        i32.sub
                        local.get 1
                        local.get 3
                        i32.add
                        i32.const 0
                        local.get 0
                        i32.sub
                        i32.and
                        i32.add
                        local.set 6
                      end
                      local.get 6
                      local.get 7
                      i32.le_u
                      local.get 6
                      i32.const 2147483646
                      i32.gt_u
                      i32.or
                      br_if 3 (;@6;)
                      i32.const 1468
                      i32.load
                      local.tee 0
                      if  ;; label = @10
                        i32.const 1460
                        i32.load
                        local.tee 3
                        local.get 6
                        i32.add
                        local.tee 5
                        local.get 3
                        i32.le_u
                        local.get 5
                        local.get 0
                        i32.gt_u
                        i32.or
                        br_if 4 (;@6;)
                      end
                      local.get 6
                      call $sbrk
                      local.tee 0
                      local.get 1
                      i32.ne
                      br_if 1 (;@8;)
                      br 5 (;@4;)
                    end
                    local.get 6
                    local.get 1
                    i32.sub
                    local.get 5
                    i32.and
                    local.tee 6
                    i32.const 2147483646
                    i32.gt_u
                    br_if 2 (;@6;)
                    local.get 6
                    call $sbrk
                    local.tee 1
                    local.get 0
                    i32.load
                    local.get 0
                    i32.load offset=4
                    i32.add
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 1
                    local.set 0
                  end
                  local.get 7
                  i32.const 48
                  i32.add
                  local.get 6
                  i32.le_u
                  local.get 6
                  i32.const 2147483646
                  i32.gt_u
                  i32.or
                  local.get 0
                  local.tee 1
                  i32.const -1
                  i32.eq
                  i32.or
                  i32.eqz
                  if  ;; label = @8
                    i32.const 1508
                    i32.load
                    local.tee 0
                    local.get 4
                    local.get 6
                    i32.sub
                    i32.add
                    i32.const 0
                    local.get 0
                    i32.sub
                    i32.and
                    local.tee 0
                    i32.const 2147483646
                    i32.gt_u
                    br_if 4 (;@4;)
                    local.get 0
                    call $sbrk
                    i32.const -1
                    i32.ne
                    if  ;; label = @9
                      local.get 0
                      local.get 6
                      i32.add
                      local.set 6
                      br 5 (;@4;)
                    end
                    i32.const 0
                    local.get 6
                    i32.sub
                    call $sbrk
                    drop
                    br 2 (;@6;)
                  end
                  local.get 1
                  i32.const -1
                  i32.ne
                  br_if 3 (;@4;)
                  br 1 (;@6;)
                end
                local.get 1
                i32.const -1
                i32.ne
                br_if 2 (;@4;)
              end
              i32.const 1472
              i32.const 1472
              i32.load
              i32.const 4
              i32.or
              i32.store
            end
            local.get 2
            i32.const 2147483646
            i32.gt_u
            br_if 2 (;@2;)
            local.get 2
            call $sbrk
            local.tee 1
            i32.const 0
            call $sbrk
            local.tee 0
            i32.ge_u
            local.get 1
            i32.const -1
            i32.eq
            i32.or
            local.get 0
            i32.const -1
            i32.eq
            i32.or
            br_if 2 (;@2;)
            local.get 0
            local.get 1
            i32.sub
            local.tee 6
            local.get 7
            i32.const 40
            i32.add
            i32.le_u
            br_if 2 (;@2;)
          end
          i32.const 1460
          i32.const 1460
          i32.load
          local.get 6
          i32.add
          local.tee 0
          i32.store
          local.get 0
          i32.const 1464
          i32.load
          i32.gt_u
          if  ;; label = @4
            i32.const 1464
            local.get 0
            i32.store
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 1052
                i32.load
                local.tee 5
                if  ;; label = @7
                  i32.const 1476
                  local.set 0
                  loop  ;; label = @8
                    local.get 1
                    local.get 0
                    i32.load
                    local.tee 2
                    local.get 0
                    i32.load offset=4
                    local.tee 3
                    i32.add
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 0
                    i32.load offset=8
                    local.tee 0
                    br_if 0 (;@8;)
                  end
                  br 2 (;@5;)
                end
                i32.const 1044
                i32.load
                local.tee 0
                i32.const 0
                local.get 1
                local.get 0
                i32.ge_u
                select
                i32.eqz
                if  ;; label = @7
                  i32.const 1044
                  local.get 1
                  i32.store
                end
                i32.const 0
                local.set 0
                i32.const 1480
                local.get 6
                i32.store
                i32.const 1476
                local.get 1
                i32.store
                i32.const 1060
                i32.const -1
                i32.store
                i32.const 1064
                i32.const 1500
                i32.load
                i32.store
                i32.const 1488
                i32.const 0
                i32.store
                loop  ;; label = @7
                  local.get 0
                  i32.const 3
                  i32.shl
                  local.tee 2
                  i32.const 1076
                  i32.add
                  local.get 2
                  i32.const 1068
                  i32.add
                  local.tee 3
                  i32.store
                  local.get 2
                  i32.const 1080
                  i32.add
                  local.get 3
                  i32.store
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  i32.const 32
                  i32.ne
                  br_if 0 (;@7;)
                end
                i32.const 1040
                local.get 6
                i32.const -40
                i32.add
                local.tee 0
                i32.const -8
                local.get 1
                i32.sub
                i32.const 7
                i32.and
                i32.const 0
                local.get 1
                i32.const 8
                i32.add
                i32.const 7
                i32.and
                select
                local.tee 2
                i32.sub
                local.tee 3
                i32.store
                i32.const 1052
                local.get 1
                local.get 2
                i32.add
                local.tee 2
                i32.store
                local.get 2
                local.get 3
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 0
                local.get 1
                i32.add
                i32.const 40
                i32.store offset=4
                i32.const 1056
                i32.const 1516
                i32.load
                i32.store
                br 2 (;@4;)
              end
              local.get 0
              i32.load8_u offset=12
              i32.const 8
              i32.and
              local.get 1
              local.get 5
              i32.le_u
              i32.or
              local.get 2
              local.get 5
              i32.gt_u
              i32.or
              br_if 0 (;@5;)
              local.get 0
              local.get 3
              local.get 6
              i32.add
              i32.store offset=4
              i32.const 1052
              local.get 5
              i32.const -8
              local.get 5
              i32.sub
              i32.const 7
              i32.and
              i32.const 0
              local.get 5
              i32.const 8
              i32.add
              i32.const 7
              i32.and
              select
              local.tee 0
              i32.add
              local.tee 1
              i32.store
              i32.const 1040
              i32.const 1040
              i32.load
              local.get 6
              i32.add
              local.tee 2
              local.get 0
              i32.sub
              local.tee 0
              i32.store
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 2
              local.get 5
              i32.add
              i32.const 40
              i32.store offset=4
              i32.const 1056
              i32.const 1516
              i32.load
              i32.store
              br 1 (;@4;)
            end
            local.get 1
            i32.const 1044
            i32.load
            local.tee 4
            i32.lt_u
            if  ;; label = @5
              i32.const 1044
              local.get 1
              i32.store
              local.get 1
              local.set 4
            end
            local.get 1
            local.get 6
            i32.add
            local.set 2
            i32.const 1476
            local.set 0
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 2
                    local.get 0
                    i32.load
                    i32.ne
                    if  ;; label = @9
                      local.get 0
                      i32.load offset=8
                      local.tee 0
                      br_if 1 (;@8;)
                      br 2 (;@7;)
                    end
                  end
                  local.get 0
                  i32.load8_u offset=12
                  i32.const 8
                  i32.and
                  i32.eqz
                  br_if 1 (;@6;)
                end
                i32.const 1476
                local.set 0
                loop  ;; label = @7
                  local.get 0
                  i32.load
                  local.tee 2
                  local.get 5
                  i32.le_u
                  if  ;; label = @8
                    local.get 2
                    local.get 0
                    i32.load offset=4
                    i32.add
                    local.tee 3
                    local.get 5
                    i32.gt_u
                    br_if 3 (;@5;)
                  end
                  local.get 0
                  i32.load offset=8
                  local.set 0
                  br 0 (;@7;)
                  unreachable
                end
                unreachable
              end
              local.get 0
              local.get 1
              i32.store
              local.get 0
              local.get 0
              i32.load offset=4
              local.get 6
              i32.add
              i32.store offset=4
              local.get 1
              i32.const -8
              local.get 1
              i32.sub
              i32.const 7
              i32.and
              i32.const 0
              local.get 1
              i32.const 8
              i32.add
              i32.const 7
              i32.and
              select
              i32.add
              local.tee 9
              local.get 7
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 2
              i32.const -8
              local.get 2
              i32.sub
              i32.const 7
              i32.and
              i32.const 0
              local.get 2
              i32.const 8
              i32.add
              i32.const 7
              i32.and
              select
              i32.add
              local.tee 1
              local.get 9
              i32.sub
              local.get 7
              i32.sub
              local.set 0
              local.get 7
              local.get 9
              i32.add
              local.set 8
              block  ;; label = @6
                local.get 1
                local.get 5
                i32.eq
                if  ;; label = @7
                  i32.const 1052
                  local.get 8
                  i32.store
                  i32.const 1040
                  i32.const 1040
                  i32.load
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store
                  local.get 8
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  br 1 (;@6;)
                end
                local.get 1
                i32.const 1048
                i32.load
                i32.eq
                if  ;; label = @7
                  i32.const 1048
                  local.get 8
                  i32.store
                  i32.const 1036
                  i32.const 1036
                  i32.load
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store
                  local.get 8
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 8
                  i32.add
                  local.get 0
                  i32.store
                  br 1 (;@6;)
                end
                local.get 1
                i32.load offset=4
                local.tee 10
                i32.const 3
                i32.and
                i32.const 1
                i32.eq
                if  ;; label = @7
                  block  ;; label = @8
                    local.get 10
                    i32.const 255
                    i32.le_u
                    if  ;; label = @9
                      local.get 1
                      i32.load offset=12
                      local.set 2
                      local.get 1
                      i32.load offset=8
                      local.tee 3
                      local.get 10
                      i32.const 3
                      i32.shr_u
                      local.tee 7
                      i32.const 3
                      i32.shl
                      i32.const 1068
                      i32.add
                      local.tee 6
                      i32.ne
                      if  ;; label = @10
                        local.get 4
                        local.get 3
                        i32.gt_u
                        br_if 7 (;@3;)
                        local.get 3
                        i32.load offset=12
                        local.get 1
                        i32.ne
                        br_if 7 (;@3;)
                      end
                      local.get 2
                      local.get 3
                      i32.eq
                      if  ;; label = @10
                        i32.const 1028
                        i32.const 1028
                        i32.load
                        i32.const -2
                        local.get 7
                        i32.rotl
                        i32.and
                        i32.store
                        br 2 (;@8;)
                      end
                      local.get 2
                      local.get 6
                      i32.ne
                      if  ;; label = @10
                        local.get 4
                        local.get 2
                        i32.gt_u
                        br_if 7 (;@3;)
                        local.get 2
                        i32.load offset=8
                        local.get 1
                        i32.ne
                        br_if 7 (;@3;)
                      end
                      local.get 3
                      local.get 2
                      i32.store offset=12
                      local.get 2
                      local.get 3
                      i32.store offset=8
                      br 1 (;@8;)
                    end
                    local.get 1
                    i32.load offset=24
                    local.set 5
                    block  ;; label = @9
                      local.get 1
                      local.get 1
                      i32.load offset=12
                      local.tee 6
                      i32.ne
                      if  ;; label = @10
                        local.get 4
                        local.get 1
                        i32.load offset=8
                        local.tee 2
                        i32.gt_u
                        br_if 7 (;@3;)
                        local.get 2
                        i32.load offset=12
                        local.get 1
                        i32.ne
                        br_if 7 (;@3;)
                        local.get 6
                        i32.load offset=8
                        local.get 1
                        i32.ne
                        br_if 7 (;@3;)
                        local.get 2
                        local.get 6
                        i32.store offset=12
                        local.get 6
                        local.get 2
                        i32.store offset=8
                        br 1 (;@9;)
                      end
                      block  ;; label = @10
                        local.get 1
                        i32.const 20
                        i32.add
                        local.tee 2
                        i32.load
                        local.tee 7
                        br_if 0 (;@10;)
                        local.get 1
                        i32.const 16
                        i32.add
                        local.tee 2
                        i32.load
                        local.tee 7
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 6
                        br 1 (;@9;)
                      end
                      loop  ;; label = @10
                        local.get 2
                        local.set 3
                        local.get 7
                        local.tee 6
                        i32.const 20
                        i32.add
                        local.tee 2
                        i32.load
                        local.tee 7
                        br_if 0 (;@10;)
                        local.get 6
                        i32.const 16
                        i32.add
                        local.set 2
                        local.get 6
                        i32.load offset=16
                        local.tee 7
                        br_if 0 (;@10;)
                      end
                      local.get 4
                      local.get 3
                      i32.gt_u
                      br_if 6 (;@3;)
                      local.get 3
                      i32.const 0
                      i32.store
                    end
                    local.get 5
                    i32.eqz
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 1
                      local.get 1
                      i32.load offset=28
                      local.tee 2
                      i32.const 2
                      i32.shl
                      i32.const 1332
                      i32.add
                      local.tee 3
                      i32.load
                      i32.eq
                      if  ;; label = @10
                        local.get 3
                        local.get 6
                        i32.store
                        local.get 6
                        br_if 1 (;@9;)
                        i32.const 1032
                        i32.const 1032
                        i32.load
                        i32.const -2
                        local.get 2
                        i32.rotl
                        i32.and
                        i32.store
                        br 2 (;@8;)
                      end
                      i32.const 1044
                      i32.load
                      local.get 5
                      i32.gt_u
                      br_if 6 (;@3;)
                      local.get 5
                      i32.const 16
                      i32.const 20
                      local.get 5
                      i32.load offset=16
                      local.get 1
                      i32.eq
                      select
                      i32.add
                      local.get 6
                      i32.store
                      local.get 6
                      i32.eqz
                      br_if 1 (;@8;)
                    end
                    i32.const 1044
                    i32.load
                    local.tee 3
                    local.get 6
                    i32.gt_u
                    br_if 5 (;@3;)
                    local.get 6
                    local.get 5
                    i32.store offset=24
                    local.get 1
                    i32.load offset=16
                    local.tee 2
                    if  ;; label = @9
                      local.get 3
                      local.get 2
                      i32.gt_u
                      br_if 6 (;@3;)
                      local.get 6
                      local.get 2
                      i32.store offset=16
                      local.get 2
                      local.get 6
                      i32.store offset=24
                    end
                    local.get 1
                    i32.load offset=20
                    local.tee 2
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 1044
                    i32.load
                    local.get 2
                    i32.gt_u
                    br_if 5 (;@3;)
                    local.get 6
                    local.get 2
                    i32.store offset=20
                    local.get 2
                    local.get 6
                    i32.store offset=24
                  end
                  local.get 10
                  i32.const -8
                  i32.and
                  local.tee 2
                  local.get 0
                  i32.add
                  local.set 0
                  local.get 1
                  local.get 2
                  i32.add
                  local.set 1
                end
                local.get 1
                local.get 1
                i32.load offset=4
                i32.const -2
                i32.and
                i32.store offset=4
                local.get 8
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 0
                local.get 8
                i32.add
                local.get 0
                i32.store
                local.get 0
                i32.const 255
                i32.le_u
                if  ;; label = @7
                  local.get 0
                  i32.const 3
                  i32.shr_u
                  local.tee 1
                  i32.const 3
                  i32.shl
                  i32.const 1068
                  i32.add
                  local.set 0
                  block  ;; label = @8
                    i32.const 1028
                    i32.load
                    local.tee 2
                    i32.const 1
                    local.get 1
                    i32.shl
                    local.tee 1
                    i32.and
                    i32.eqz
                    if  ;; label = @9
                      i32.const 1028
                      local.get 1
                      local.get 2
                      i32.or
                      i32.store
                      local.get 0
                      local.set 2
                      br 1 (;@8;)
                    end
                    i32.const 1044
                    i32.load
                    local.get 0
                    i32.load offset=8
                    local.tee 2
                    i32.gt_u
                    br_if 5 (;@3;)
                  end
                  local.get 0
                  local.get 8
                  i32.store offset=8
                  local.get 2
                  local.get 8
                  i32.store offset=12
                  local.get 8
                  local.get 0
                  i32.store offset=12
                  local.get 8
                  local.get 2
                  i32.store offset=8
                  br 1 (;@6;)
                end
                local.get 8
                block (result i32)  ;; label = @7
                  i32.const 0
                  local.get 0
                  i32.const 8
                  i32.shr_u
                  local.tee 1
                  i32.eqz
                  br_if 0 (;@7;)
                  drop
                  i32.const 31
                  local.get 0
                  i32.const 16777215
                  i32.gt_u
                  br_if 0 (;@7;)
                  drop
                  local.get 1
                  local.get 1
                  i32.const 1048320
                  i32.add
                  i32.const 16
                  i32.shr_u
                  i32.const 8
                  i32.and
                  local.tee 1
                  i32.shl
                  local.tee 2
                  local.get 2
                  i32.const 520192
                  i32.add
                  i32.const 16
                  i32.shr_u
                  i32.const 4
                  i32.and
                  local.tee 2
                  i32.shl
                  local.tee 3
                  local.get 3
                  i32.const 245760
                  i32.add
                  i32.const 16
                  i32.shr_u
                  i32.const 2
                  i32.and
                  local.tee 3
                  i32.shl
                  i32.const 15
                  i32.shr_u
                  local.get 1
                  local.get 2
                  i32.or
                  local.get 3
                  i32.or
                  i32.sub
                  local.tee 1
                  i32.const 1
                  i32.shl
                  local.get 0
                  local.get 1
                  i32.const 21
                  i32.add
                  i32.shr_u
                  i32.const 1
                  i32.and
                  i32.or
                  i32.const 28
                  i32.add
                end
                local.tee 1
                i32.store offset=28
                local.get 8
                i64.const 0
                i64.store offset=16 align=4
                local.get 1
                i32.const 2
                i32.shl
                i32.const 1332
                i32.add
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 1032
                    i32.load
                    local.tee 2
                    i32.const 1
                    local.get 1
                    i32.shl
                    local.tee 4
                    i32.and
                    i32.eqz
                    if  ;; label = @9
                      i32.const 1032
                      local.get 2
                      local.get 4
                      i32.or
                      i32.store
                      local.get 3
                      local.get 8
                      i32.store
                      br 1 (;@8;)
                    end
                    local.get 0
                    i32.const 0
                    i32.const 25
                    local.get 1
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 1
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 2
                    local.get 3
                    i32.load
                    local.set 1
                    loop  ;; label = @9
                      local.get 1
                      local.tee 3
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 0
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 2
                      i32.const 29
                      i32.shr_u
                      local.set 1
                      local.get 2
                      i32.const 1
                      i32.shl
                      local.set 2
                      local.get 3
                      local.get 1
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      local.tee 4
                      i32.load
                      local.tee 1
                      br_if 0 (;@9;)
                    end
                    i32.const 1044
                    i32.load
                    local.get 4
                    i32.gt_u
                    br_if 5 (;@3;)
                    local.get 4
                    local.get 8
                    i32.store
                  end
                  local.get 8
                  local.get 3
                  i32.store offset=24
                  local.get 8
                  local.get 8
                  i32.store offset=12
                  local.get 8
                  local.get 8
                  i32.store offset=8
                  br 1 (;@6;)
                end
                i32.const 1044
                i32.load
                local.tee 1
                local.get 3
                i32.load offset=8
                local.tee 0
                i32.gt_u
                local.get 1
                local.get 3
                i32.gt_u
                i32.or
                br_if 3 (;@3;)
                local.get 0
                local.get 8
                i32.store offset=12
                local.get 3
                local.get 8
                i32.store offset=8
                local.get 8
                i32.const 0
                i32.store offset=24
                local.get 8
                local.get 3
                i32.store offset=12
                local.get 8
                local.get 0
                i32.store offset=8
              end
              local.get 9
              i32.const 8
              i32.add
              local.set 0
              br 4 (;@1;)
            end
            i32.const 1040
            local.get 6
            i32.const -40
            i32.add
            local.tee 0
            i32.const -8
            local.get 1
            i32.sub
            i32.const 7
            i32.and
            i32.const 0
            local.get 1
            i32.const 8
            i32.add
            i32.const 7
            i32.and
            select
            local.tee 2
            i32.sub
            local.tee 4
            i32.store
            i32.const 1052
            local.get 1
            local.get 2
            i32.add
            local.tee 2
            i32.store
            local.get 2
            local.get 4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 1
            i32.add
            i32.const 40
            i32.store offset=4
            i32.const 1056
            i32.const 1516
            i32.load
            i32.store
            local.get 5
            local.get 3
            i32.const 39
            local.get 3
            i32.sub
            i32.const 7
            i32.and
            i32.const 0
            local.get 3
            i32.const -39
            i32.add
            i32.const 7
            i32.and
            select
            i32.add
            i32.const -47
            i32.add
            local.tee 0
            local.get 0
            local.get 5
            i32.const 16
            i32.add
            i32.lt_u
            select
            local.tee 2
            i32.const 27
            i32.store offset=4
            local.get 2
            i32.const 1484
            i64.load align=4
            i64.store offset=16 align=4
            local.get 2
            i32.const 1476
            i64.load align=4
            i64.store offset=8 align=4
            i32.const 1484
            local.get 2
            i32.const 8
            i32.add
            i32.store
            i32.const 1480
            local.get 6
            i32.store
            i32.const 1476
            local.get 1
            i32.store
            i32.const 1488
            i32.const 0
            i32.store
            local.get 2
            i32.const 24
            i32.add
            local.set 0
            loop  ;; label = @5
              local.get 0
              i32.const 7
              i32.store offset=4
              local.get 0
              i32.const 8
              i32.add
              local.set 1
              local.get 0
              i32.const 4
              i32.add
              local.set 0
              local.get 1
              local.get 3
              i32.lt_u
              br_if 0 (;@5;)
            end
            local.get 2
            local.get 5
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            local.get 2
            i32.load offset=4
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 5
            local.get 2
            local.get 5
            i32.sub
            local.tee 3
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 2
            local.get 3
            i32.store
            local.get 3
            i32.const 255
            i32.le_u
            if  ;; label = @5
              local.get 3
              i32.const 3
              i32.shr_u
              local.tee 1
              i32.const 3
              i32.shl
              i32.const 1068
              i32.add
              local.set 0
              block  ;; label = @6
                i32.const 1028
                i32.load
                local.tee 2
                i32.const 1
                local.get 1
                i32.shl
                local.tee 1
                i32.and
                i32.eqz
                if  ;; label = @7
                  i32.const 1028
                  local.get 1
                  local.get 2
                  i32.or
                  i32.store
                  local.get 0
                  local.set 3
                  br 1 (;@6;)
                end
                i32.const 1044
                i32.load
                local.get 0
                i32.load offset=8
                local.tee 3
                i32.gt_u
                br_if 3 (;@3;)
              end
              local.get 0
              local.get 5
              i32.store offset=8
              local.get 3
              local.get 5
              i32.store offset=12
              local.get 5
              local.get 0
              i32.store offset=12
              local.get 5
              local.get 3
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 5
            i64.const 0
            i64.store offset=16 align=4
            local.get 5
            block (result i32)  ;; label = @5
              i32.const 0
              local.get 3
              i32.const 8
              i32.shr_u
              local.tee 0
              i32.eqz
              br_if 0 (;@5;)
              drop
              i32.const 31
              local.get 3
              i32.const 16777215
              i32.gt_u
              br_if 0 (;@5;)
              drop
              local.get 0
              local.get 0
              i32.const 1048320
              i32.add
              i32.const 16
              i32.shr_u
              i32.const 8
              i32.and
              local.tee 0
              i32.shl
              local.tee 1
              local.get 1
              i32.const 520192
              i32.add
              i32.const 16
              i32.shr_u
              i32.const 4
              i32.and
              local.tee 1
              i32.shl
              local.tee 2
              local.get 2
              i32.const 245760
              i32.add
              i32.const 16
              i32.shr_u
              i32.const 2
              i32.and
              local.tee 2
              i32.shl
              i32.const 15
              i32.shr_u
              local.get 0
              local.get 1
              i32.or
              local.get 2
              i32.or
              i32.sub
              local.tee 0
              i32.const 1
              i32.shl
              local.get 3
              local.get 0
              i32.const 21
              i32.add
              i32.shr_u
              i32.const 1
              i32.and
              i32.or
              i32.const 28
              i32.add
            end
            local.tee 0
            i32.store offset=28
            local.get 0
            i32.const 2
            i32.shl
            i32.const 1332
            i32.add
            local.set 1
            block  ;; label = @5
              block  ;; label = @6
                i32.const 1032
                i32.load
                local.tee 2
                i32.const 1
                local.get 0
                i32.shl
                local.tee 4
                i32.and
                i32.eqz
                if  ;; label = @7
                  i32.const 1032
                  local.get 2
                  local.get 4
                  i32.or
                  i32.store
                  local.get 1
                  local.get 5
                  i32.store
                  local.get 5
                  local.get 1
                  i32.store offset=24
                  br 1 (;@6;)
                end
                local.get 3
                i32.const 0
                i32.const 25
                local.get 0
                i32.const 1
                i32.shr_u
                i32.sub
                local.get 0
                i32.const 31
                i32.eq
                select
                i32.shl
                local.set 0
                local.get 1
                i32.load
                local.set 1
                loop  ;; label = @7
                  local.get 1
                  local.tee 2
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 3
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 0
                  i32.const 29
                  i32.shr_u
                  local.set 1
                  local.get 0
                  i32.const 1
                  i32.shl
                  local.set 0
                  local.get 2
                  local.get 1
                  i32.const 4
                  i32.and
                  i32.add
                  i32.const 16
                  i32.add
                  local.tee 4
                  i32.load
                  local.tee 1
                  br_if 0 (;@7;)
                end
                i32.const 1044
                i32.load
                local.get 4
                i32.gt_u
                br_if 3 (;@3;)
                local.get 4
                local.get 5
                i32.store
                local.get 5
                local.get 2
                i32.store offset=24
              end
              local.get 5
              local.get 5
              i32.store offset=12
              local.get 5
              local.get 5
              i32.store offset=8
              br 1 (;@4;)
            end
            i32.const 1044
            i32.load
            local.tee 1
            local.get 2
            i32.load offset=8
            local.tee 0
            i32.gt_u
            local.get 1
            local.get 2
            i32.gt_u
            i32.or
            br_if 1 (;@3;)
            local.get 0
            local.get 5
            i32.store offset=12
            local.get 2
            local.get 5
            i32.store offset=8
            local.get 5
            i32.const 0
            i32.store offset=24
            local.get 5
            local.get 2
            i32.store offset=12
            local.get 5
            local.get 0
            i32.store offset=8
          end
          i32.const 1040
          i32.load
          local.tee 0
          local.get 7
          i32.le_u
          br_if 1 (;@2;)
          i32.const 1040
          local.get 0
          local.get 7
          i32.sub
          local.tee 1
          i32.store
          i32.const 1052
          i32.const 1052
          i32.load
          local.tee 0
          local.get 7
          i32.add
          local.tee 2
          i32.store
          local.get 2
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 7
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          i32.const 8
          i32.add
          local.set 0
          br 2 (;@1;)
        end
        call $abort
        unreachable
      end
      i32.const 1024
      i32.const 12
      i32.store
      i32.const 0
      local.set 0
    end
    local.get 12
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $dlfree (type 4) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.add
        local.tee 3
        i32.const 1044
        i32.load
        local.tee 7
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 1
        i32.const 3
        i32.and
        local.tee 2
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        local.get 3
        local.get 1
        i32.const -8
        i32.and
        local.tee 0
        i32.add
        local.set 5
        block  ;; label = @3
          local.get 1
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 3
          local.get 3
          i32.load
          local.tee 4
          i32.sub
          local.tee 3
          local.get 7
          i32.lt_u
          br_if 2 (;@1;)
          local.get 0
          local.get 4
          i32.add
          local.set 0
          local.get 3
          i32.const 1048
          i32.load
          i32.ne
          if  ;; label = @4
            local.get 4
            i32.const 255
            i32.le_u
            if  ;; label = @5
              local.get 3
              i32.load offset=12
              local.set 1
              local.get 3
              i32.load offset=8
              local.tee 2
              local.get 4
              i32.const 3
              i32.shr_u
              local.tee 4
              i32.const 3
              i32.shl
              i32.const 1068
              i32.add
              local.tee 6
              i32.ne
              if  ;; label = @6
                local.get 7
                local.get 2
                i32.gt_u
                br_if 5 (;@1;)
                local.get 2
                i32.load offset=12
                local.get 3
                i32.ne
                br_if 5 (;@1;)
              end
              local.get 1
              local.get 2
              i32.eq
              if  ;; label = @6
                i32.const 1028
                i32.const 1028
                i32.load
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store
                br 3 (;@3;)
              end
              local.get 1
              local.get 6
              i32.ne
              if  ;; label = @6
                local.get 7
                local.get 1
                i32.gt_u
                br_if 5 (;@1;)
                local.get 1
                i32.load offset=8
                local.get 3
                i32.ne
                br_if 5 (;@1;)
              end
              local.get 2
              local.get 1
              i32.store offset=12
              local.get 1
              local.get 2
              i32.store offset=8
              br 2 (;@3;)
            end
            local.get 3
            i32.load offset=24
            local.set 8
            block  ;; label = @5
              local.get 3
              local.get 3
              i32.load offset=12
              local.tee 1
              i32.ne
              if  ;; label = @6
                local.get 7
                local.get 3
                i32.load offset=8
                local.tee 2
                i32.gt_u
                br_if 5 (;@1;)
                local.get 2
                i32.load offset=12
                local.get 3
                i32.ne
                br_if 5 (;@1;)
                local.get 1
                i32.load offset=8
                local.get 3
                i32.ne
                br_if 5 (;@1;)
                local.get 2
                local.get 1
                i32.store offset=12
                local.get 1
                local.get 2
                i32.store offset=8
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 3
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 3
                i32.const 16
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 1
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 2
                local.set 6
                local.get 4
                local.tee 1
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 1
                i32.const 16
                i32.add
                local.set 2
                local.get 1
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 7
              local.get 6
              i32.gt_u
              br_if 4 (;@1;)
              local.get 6
              i32.const 0
              i32.store
            end
            local.get 8
            i32.eqz
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 3
              local.get 3
              i32.load offset=28
              local.tee 2
              i32.const 2
              i32.shl
              i32.const 1332
              i32.add
              local.tee 4
              i32.load
              i32.eq
              if  ;; label = @6
                local.get 4
                local.get 1
                i32.store
                local.get 1
                br_if 1 (;@5;)
                i32.const 1032
                i32.const 1032
                i32.load
                i32.const -2
                local.get 2
                i32.rotl
                i32.and
                i32.store
                br 3 (;@3;)
              end
              i32.const 1044
              i32.load
              local.get 8
              i32.gt_u
              br_if 4 (;@1;)
              local.get 8
              i32.const 16
              i32.const 20
              local.get 8
              i32.load offset=16
              local.get 3
              i32.eq
              select
              i32.add
              local.get 1
              i32.store
              local.get 1
              i32.eqz
              br_if 2 (;@3;)
            end
            i32.const 1044
            i32.load
            local.tee 4
            local.get 1
            i32.gt_u
            br_if 3 (;@1;)
            local.get 1
            local.get 8
            i32.store offset=24
            local.get 3
            i32.load offset=16
            local.tee 2
            if  ;; label = @5
              local.get 4
              local.get 2
              i32.gt_u
              br_if 4 (;@1;)
              local.get 1
              local.get 2
              i32.store offset=16
              local.get 2
              local.get 1
              i32.store offset=24
            end
            local.get 3
            i32.load offset=20
            local.tee 2
            i32.eqz
            br_if 1 (;@3;)
            i32.const 1044
            i32.load
            local.get 2
            i32.gt_u
            br_if 3 (;@1;)
            local.get 1
            local.get 2
            i32.store offset=20
            local.get 2
            local.get 1
            i32.store offset=24
            br 1 (;@3;)
          end
          local.get 5
          i32.load offset=4
          local.tee 1
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 0 (;@3;)
          i32.const 1036
          local.get 0
          i32.store
          local.get 5
          local.get 1
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 3
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 0
          i32.store
          return
        end
        local.get 5
        local.get 3
        i32.le_u
        br_if 1 (;@1;)
        local.get 5
        i32.load offset=4
        local.tee 7
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 7
          i32.const 2
          i32.and
          i32.eqz
          if  ;; label = @4
            local.get 5
            i32.const 1052
            i32.load
            i32.eq
            if  ;; label = @5
              i32.const 1052
              local.get 3
              i32.store
              i32.const 1040
              i32.const 1040
              i32.load
              local.get 0
              i32.add
              local.tee 0
              i32.store
              local.get 3
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 3
              i32.const 1048
              i32.load
              i32.ne
              br_if 3 (;@2;)
              i32.const 1036
              i32.const 0
              i32.store
              i32.const 1048
              i32.const 0
              i32.store
              return
            end
            local.get 5
            i32.const 1048
            i32.load
            i32.eq
            if  ;; label = @5
              i32.const 1048
              local.get 3
              i32.store
              i32.const 1036
              i32.const 1036
              i32.load
              local.get 0
              i32.add
              local.tee 0
              i32.store
              local.get 3
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              local.get 0
              i32.store
              return
            end
            block  ;; label = @5
              local.get 7
              i32.const 255
              i32.le_u
              if  ;; label = @6
                local.get 5
                i32.load offset=12
                local.set 1
                local.get 5
                i32.load offset=8
                local.tee 2
                local.get 7
                i32.const 3
                i32.shr_u
                local.tee 4
                i32.const 3
                i32.shl
                i32.const 1068
                i32.add
                local.tee 6
                i32.ne
                if  ;; label = @7
                  i32.const 1044
                  i32.load
                  local.get 2
                  i32.gt_u
                  br_if 6 (;@1;)
                  local.get 2
                  i32.load offset=12
                  local.get 5
                  i32.ne
                  br_if 6 (;@1;)
                end
                local.get 1
                local.get 2
                i32.eq
                if  ;; label = @7
                  i32.const 1028
                  i32.const 1028
                  i32.load
                  i32.const -2
                  local.get 4
                  i32.rotl
                  i32.and
                  i32.store
                  br 2 (;@5;)
                end
                local.get 1
                local.get 6
                i32.ne
                if  ;; label = @7
                  i32.const 1044
                  i32.load
                  local.get 1
                  i32.gt_u
                  br_if 6 (;@1;)
                  local.get 1
                  i32.load offset=8
                  local.get 5
                  i32.ne
                  br_if 6 (;@1;)
                end
                local.get 2
                local.get 1
                i32.store offset=12
                local.get 1
                local.get 2
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 5
              i32.load offset=24
              local.set 8
              block  ;; label = @6
                local.get 5
                local.get 5
                i32.load offset=12
                local.tee 1
                i32.ne
                if  ;; label = @7
                  i32.const 1044
                  i32.load
                  local.get 5
                  i32.load offset=8
                  local.tee 2
                  i32.gt_u
                  br_if 6 (;@1;)
                  local.get 2
                  i32.load offset=12
                  local.get 5
                  i32.ne
                  br_if 6 (;@1;)
                  local.get 1
                  i32.load offset=8
                  local.get 5
                  i32.ne
                  br_if 6 (;@1;)
                  local.get 2
                  local.get 1
                  i32.store offset=12
                  local.get 1
                  local.get 2
                  i32.store offset=8
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 5
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 16
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 1
                  br 1 (;@6;)
                end
                loop  ;; label = @7
                  local.get 2
                  local.set 6
                  local.get 4
                  local.tee 1
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 16
                  i32.add
                  local.set 2
                  local.get 1
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                i32.const 1044
                i32.load
                local.get 6
                i32.gt_u
                br_if 5 (;@1;)
                local.get 6
                i32.const 0
                i32.store
              end
              local.get 8
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 5
                local.get 5
                i32.load offset=28
                local.tee 2
                i32.const 2
                i32.shl
                i32.const 1332
                i32.add
                local.tee 4
                i32.load
                i32.eq
                if  ;; label = @7
                  local.get 4
                  local.get 1
                  i32.store
                  local.get 1
                  br_if 1 (;@6;)
                  i32.const 1032
                  i32.const 1032
                  i32.load
                  i32.const -2
                  local.get 2
                  i32.rotl
                  i32.and
                  i32.store
                  br 2 (;@5;)
                end
                i32.const 1044
                i32.load
                local.get 8
                i32.gt_u
                br_if 5 (;@1;)
                local.get 8
                i32.const 16
                i32.const 20
                local.get 8
                i32.load offset=16
                local.get 5
                i32.eq
                select
                i32.add
                local.get 1
                i32.store
                local.get 1
                i32.eqz
                br_if 1 (;@5;)
              end
              i32.const 1044
              i32.load
              local.tee 4
              local.get 1
              i32.gt_u
              br_if 4 (;@1;)
              local.get 1
              local.get 8
              i32.store offset=24
              local.get 5
              i32.load offset=16
              local.tee 2
              if  ;; label = @6
                local.get 4
                local.get 2
                i32.gt_u
                br_if 5 (;@1;)
                local.get 1
                local.get 2
                i32.store offset=16
                local.get 2
                local.get 1
                i32.store offset=24
              end
              local.get 5
              i32.load offset=20
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              i32.const 1044
              i32.load
              local.get 2
              i32.gt_u
              br_if 4 (;@1;)
              local.get 1
              local.get 2
              i32.store offset=20
              local.get 2
              local.get 1
              i32.store offset=24
            end
            local.get 3
            local.get 7
            i32.const -8
            i32.and
            local.get 0
            i32.add
            local.tee 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 3
            i32.add
            local.get 0
            i32.store
            local.get 3
            i32.const 1048
            i32.load
            i32.ne
            br_if 1 (;@3;)
            i32.const 1036
            local.get 0
            i32.store
            return
          end
          local.get 5
          local.get 7
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 3
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 0
          i32.store
        end
        local.get 0
        i32.const 255
        i32.le_u
        if  ;; label = @3
          local.get 0
          i32.const 3
          i32.shr_u
          local.tee 1
          i32.const 3
          i32.shl
          i32.const 1068
          i32.add
          local.set 0
          block  ;; label = @4
            i32.const 1028
            i32.load
            local.tee 2
            i32.const 1
            local.get 1
            i32.shl
            local.tee 1
            i32.and
            i32.eqz
            if  ;; label = @5
              i32.const 1028
              local.get 1
              local.get 2
              i32.or
              i32.store
              local.get 0
              local.set 2
              br 1 (;@4;)
            end
            i32.const 1044
            i32.load
            local.get 0
            i32.load offset=8
            local.tee 2
            i32.gt_u
            br_if 3 (;@1;)
          end
          local.get 0
          local.get 3
          i32.store offset=8
          local.get 2
          local.get 3
          i32.store offset=12
          local.get 3
          local.get 0
          i32.store offset=12
          local.get 3
          local.get 2
          i32.store offset=8
          return
        end
        local.get 3
        i64.const 0
        i64.store offset=16 align=4
        local.get 3
        block (result i32)  ;; label = @3
          i32.const 0
          local.get 0
          i32.const 8
          i32.shr_u
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          drop
          i32.const 31
          local.get 0
          i32.const 16777215
          i32.gt_u
          br_if 0 (;@3;)
          drop
          local.get 1
          local.get 1
          i32.const 1048320
          i32.add
          i32.const 16
          i32.shr_u
          i32.const 8
          i32.and
          local.tee 1
          i32.shl
          local.tee 2
          local.get 2
          i32.const 520192
          i32.add
          i32.const 16
          i32.shr_u
          i32.const 4
          i32.and
          local.tee 2
          i32.shl
          local.tee 4
          local.get 4
          i32.const 245760
          i32.add
          i32.const 16
          i32.shr_u
          i32.const 2
          i32.and
          local.tee 4
          i32.shl
          i32.const 15
          i32.shr_u
          local.get 1
          local.get 2
          i32.or
          local.get 4
          i32.or
          i32.sub
          local.tee 1
          i32.const 1
          i32.shl
          local.get 0
          local.get 1
          i32.const 21
          i32.add
          i32.shr_u
          i32.const 1
          i32.and
          i32.or
          i32.const 28
          i32.add
        end
        local.tee 2
        i32.store offset=28
        local.get 2
        i32.const 2
        i32.shl
        i32.const 1332
        i32.add
        local.set 1
        block  ;; label = @3
          i32.const 1032
          i32.load
          local.tee 4
          i32.const 1
          local.get 2
          i32.shl
          local.tee 6
          i32.and
          i32.eqz
          if  ;; label = @4
            i32.const 1032
            local.get 4
            local.get 6
            i32.or
            i32.store
            local.get 1
            local.get 3
            i32.store
            local.get 3
            local.get 3
            i32.store offset=12
            local.get 3
            local.get 1
            i32.store offset=24
            local.get 3
            local.get 3
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 0
          i32.const 0
          i32.const 25
          local.get 2
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 2
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 2
          local.get 1
          i32.load
          local.set 1
          block  ;; label = @4
            loop  ;; label = @5
              local.get 1
              local.tee 4
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 0
              i32.eq
              br_if 1 (;@4;)
              local.get 2
              i32.const 29
              i32.shr_u
              local.set 1
              local.get 2
              i32.const 1
              i32.shl
              local.set 2
              local.get 4
              local.get 1
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 6
              i32.load
              local.tee 1
              br_if 0 (;@5;)
            end
            i32.const 1044
            i32.load
            local.get 6
            i32.gt_u
            br_if 3 (;@1;)
            local.get 6
            local.get 3
            i32.store
            local.get 3
            local.get 3
            i32.store offset=12
            local.get 3
            local.get 4
            i32.store offset=24
            local.get 3
            local.get 3
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 1044
          i32.load
          local.tee 1
          local.get 4
          i32.load offset=8
          local.tee 0
          i32.gt_u
          local.get 1
          local.get 4
          i32.gt_u
          i32.or
          br_if 2 (;@1;)
          local.get 0
          local.get 3
          i32.store offset=12
          local.get 4
          local.get 3
          i32.store offset=8
          local.get 3
          i32.const 0
          i32.store offset=24
          local.get 3
          local.get 4
          i32.store offset=12
          local.get 3
          local.get 0
          i32.store offset=8
        end
        i32.const 1060
        i32.const 1060
        i32.load
        i32.const -1
        i32.add
        local.tee 0
        i32.store
        local.get 0
        br_if 0 (;@2;)
        i32.const 1484
        local.set 3
        loop  ;; label = @3
          local.get 3
          i32.load
          local.tee 0
          i32.const 8
          i32.add
          local.set 3
          local.get 0
          br_if 0 (;@3;)
        end
        i32.const 1060
        i32.const -1
        i32.store
      end
      return
    end
    call $abort
    unreachable)
  (func $setThrew (type 5) (param i32 i32)
    i32.const 1524
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 1528
      local.get 1
      i32.store
      i32.const 1524
      local.get 0
      i32.store
    end)
  (func $stackSave (type 3) (result i32)
    global.get 0)
  (func $stackAlloc (type 0) (param i32) (result i32)
    global.get 0
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 0
    global.set 0
    local.get 0)
  (func $stackRestore (type 4) (param i32)
    local.get 0
    global.set 0)
  (func $__growWasmMemory (type 0) (param i32) (result i32)
    local.get 0
    memory.grow)
  (global (;0;) (mut i32) (i32.const 5244416))
  (global (;1;) i32 (i32.const 1532))
  (export "__data_end" (global 1))
  (export "main" (func $main))
  (export "__errno_location" (func $__errno_location))
  (export "malloc" (func $dlmalloc))
  (export "free" (func $dlfree))
  (export "setThrew" (func $setThrew))
  (export "stackSave" (func $stackSave))
  (export "stackAlloc" (func $stackAlloc))
  (export "stackRestore" (func $stackRestore))
  (export "__growWasmMemory" (func $__growWasmMemory)))
