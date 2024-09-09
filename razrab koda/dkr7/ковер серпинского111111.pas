uses GraphABC;
uses fractals;
var y,x,n,g:integer;
 procedure KeyDown(key: integer);
begin
case key of
VK_Up: begin y := y - 5; end;
VK_Down: begin y += 5; end;
VK_Left: begin x := x - 5; end;
VK_Right: begin x := x + 5; end;
VK_A: x := x - 50;
VK_D: x := x + 50;
VK_W: y := y - 50;
VK_S: y := y + 50;
VK_F: n -= 5;
VK_G: n += 5;
VK_R: g += 1;
VK_E: g -= 1;
end;
Window.Clear;
serp_square(x, y, n, g);
redraw;
end;
begin
    Window.Maximize;
    var center := window.center;
    moveto(center.x - 200, center.y - 100);
    a := 0;
    n:=300;
    g:=2;
    writeln('Смена глубина на "E" и "R"(E-уменьшение, R-увеличение)');
    writeln('Смена масштаба на "F" и "G"(F-уменьшение G-увеличение)');
    writeln('Перемешение на стрелочки и WASD');
    sleep(5000);
    window.Clear;
    serp_square(x, y, n, g);
    onKeyDown += keydown;
end.
