import turtle as t

"""看看90个会形成什么样的 --> 圆圈"""


t.fillcolor(1, 0, 0)


def draw(l):
    t.begin_fill()
    t.forward(l)
    t.right(18)
    t.forward(l)
    t.end_fill()
    t.left(22)


t.penup()
t.goto(0, -200)
t.pendown()

for i in range(90):
    draw(10)

t.exitonclick()
