import turtle as t

"""markdown: 两个三角形"""

t.fillcolor(1, 0, 0)


def draw(l):
    t.begin_fill()
    t.forward(l)
    t.right(18)
    t.forward(l)
    t.end_fill()
    t.left(22)


t.penup()
t.goto(-300, 0)
t.pendown()

for i in range(2):
    draw(200)

t.exitonclick()
