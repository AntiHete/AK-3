.global lab1
.syntax unified

lab1:
    push {lr}        @ Збереження значення регістра повернення

    mov r0, #4       @ a = 4
    mov r1, #6       @ b = 6
    add r0, r0, r1   @ a + b
    lsr r0, r0, #1   @ (a + b) / 2 (логічний зсув вправо на 1 = поділ на 2)

    mov r1, #3       @ c = 3
    bl factorial     @ Виклик функції factorial(c), результат у r0
    add r0, r0, r2   @ Додаємо факторіал до (a + b) / 2

    pop {pc}         @ Відновлення регістра та вихід

factorial:
    push {r1, r2, lr}  @ Збереження регістрів
    mov r2, #1         @ r2 = 1 (початкове значення факторіалу)

factorial_loop:
    mul r2, r2, r1     @ r2 = r2 * r1
    subs r1, r1, #1    @ r1 = r1 - 1
    bne factorial_loop @ Повторюємо, поки r1 != 0

    mov r0, r2         @ Поміщаємо результат у r0
    pop {r1, r2, lr}   @ Відновлення регістрів
    bx lr              @ Повернення з підпрограми

