import turtle as t
import colorsys

t.bgcolor("black")
t.speed("fastest")
t.tracer(100)
t.pencolor("darkviolet")
hue = 0.7
t.hideturtle()


def func():
    global hue
    for i in range(16):
        hue += 0.001
        yield hue


def draw(color):
    t.fillcolor(color)
    t.begin_fill()
    t.fd(100)
    t.right(18)
    t.fd(100)
    t.lt(22)
    t.end_fill()


for j in range(400):
    for i in func():
        color = colorsys.hsv_to_rgb(i, 1, 1)
        draw(color)
    # 此时形成了一片叶子
    t.goto(0, 0)
    t.rt(188)  # - 16 * 4 + 188 = 124

t.exitonclick()
