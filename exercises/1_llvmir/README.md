# LLVM IR

First, go into this folder:

```sh
cd exercises/1_llvmir
```

## Part 1

### Exercise 1a

Compile `ir1.cpp` to LLVM bitcode:

```sh
clang -c ir1.cpp -emit-llvm -o ir1.bc
```

This will generate `ir1.bc`, which you can disassemble with `llvm-dis` (and then view in VSCode):

```sh
llvm-dis ir1.bc -o ir1.ll
llvm-dis ir1.bc -o ir1.ll --show-annotations
```

You can also emit a human-readable bitcode file directly:

```sh
clang -c ir1.cpp -emit-llvm -S -fno-discard-value-names -g0 -o ir1.ll
```

### Exercise 1b

Compile `ir2.cpp` to LLVM bitcode and answer the following questions:

**Questions**:

1. What is the _function_ with the largest _basic block_?
- `test1_linear_flow`

2. How many globals are in the _module_?
- 21 -> 13, don't count usage of globals too

3. Which _function_ has the most _basic blocks_?
- `test10_switch` -> 14

4. How many _attribute lists_ are there?
- 3

5. How many `phi` instructions are there for each optimization level?
   - `-O1`: 8 -> 6
   - `-O2`: 15 -> 13
   - `-O3`: 15 -> 13



**Note**: Remember to keep the reference documentation handy: https://llvm.org/docs/LangRef.html




### Exercise 1c

Open the following link: https://godbolt.org/z/83EKPPh49.

**Questions**:

1. Which optimization pass introduces `phi` nodes?
- `SROAPass`

2. Which optimization pass creates a `select` instruction?
- `SimplifyCFGPass`

3. Why is the `test` function not optimized?
- `optnone`

4. What architecture was the module compiled for?
- `arm64-apple-macosx14.0.0`

5. Which compiler version was used?
- `Apple clang version 15.0.0 (clang-1500.3.9.4)`





### Exercise 1d

For this exercise you compile `exercise1d.cpp` together with `exercise1d.ll`. Write LLVM IR by hand and run the program to make sure all the tests are green. To run the tests, use the following command:

```sh
clang exercise1d.cpp exercise1d.ll -o exercise1d && ./exercise1d
```

1. `uint32_t ps3_random_number();` (return 42)
2. `uint32_t add_42(uint32_t x);`
3. `uint32_t bytes_to_bits(uint32_t bytes);`
4. `void pass_to_store_value(uint32_t n)` (call some extern "C" function)
5. `uint32_t vm_operation(bool do_add, uint32_t x, uint32_t y);`

_Note_: If you get stuck, ask a neighbor or use Godbolt to write C: https://godbolt.org/z/af44zfb9q

---

## Part 2

### Exercise 2a

Open `exercise2a.ll` and convert every function to pseudo-C. The types are defined like this:

```c
struct Vec3 {
  float x;
  float y;
  float z;
};

struct Bullet {
  uint32_t damage;
  Vec3 position;
};

struct Player {
  uint32_t id;
  char name[256];
  Vec3 position;
  Vec3 direction;
  Bullet bullet;
};
```


```c
define dso_local i32 @exercise0(ptr nocapture noundef readonly %array, i64 noundef %n) local_unnamed_addr #0 {
entry:
  %arrayidx = getelementptr inbounds i64, ptr %array, i64 %n ; get array at n
  %0 = load i64, ptr %arrayidx, align 8 ; load value at
  %conv = trunc i64 %0 to i32
  ret i32 %conv
}
```


```c
uint32_t exercise1(Player blah) {
  return blah.id;
}
```
