import colorsys
from svg_turtle import SvgTurtle

"""导出万花筒的svg"""

t = SvgTurtle(1600, 1200)

t.pencolor("darkviolet")
hue = 0.7
t.hideturtle()


def func():
    global hue
    for i in range(4*4):
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


print("Wait for svg to be saved...")

for j in range(400):
    for i in func():
        color = colorsys.hsv_to_rgb(i, 1, 1)
        draw(color)
    t.goto(0, 0)
    t.rt(188)

t.save_as("example/Kaleidoscope/assets/shape.svg")

print("Done!")
