define i32 @ps3_random_number() {
    ret i32 42
}


define i32 @add_42(i32 %0) {
1:
    %2 = add i32 %0, 42
    ret i32 %2
}


define i32 @bytes_to_bits(i32 %n) {
    %result = mul i32 %n, 8
    ret i32 %result
}


define i32 @vm_operation(i1 %do_add, i32 %x, i32 %y) {
    %temp = alloca i32, align 4

    %cond = icmp eq i1 %do_add, 0

    br i1 %cond, label %bb_if, label %bb_else

    bb_if:
    %zz = sub i32 %x, %y
    store i32 %zz, ptr %temp, align 4
    br label %bb_end

    bb_else:
    %zzz = add i32 %x, %y
    store i32 %zzz, ptr %temp, align 4
    br label %bb_end

    bb_end: ; preds = %bb_if, %bb_else
    %result = load i32, ptr %temp, align 4

    ret i32 %result
}


; define i32 @dunc_vm_operation(i1 %do_add, i32 %x, i32 %y) {
;     %result_add = add i32 %x, %y
;     %result_sub = add i32 %x, %y

;     %result = select i1 %do_add, i32 %result_add, i32 %result_sub
;     ret i32 %result
; }



declare void @store_value(i32 %n)

define void @pass_to_store_value(i32 %n) {
    %lowest_bit = trunc i32 %n to i1
    %key = select i1 %lowest_bit, i32 512, i32 99
    call void @store_value(i32 %n, i32 %key)
    ret void
}


define i32 @upper_32_bits(i64 %n) {
    unreachable
}
