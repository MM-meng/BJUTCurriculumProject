% ʹ��Bresenham�������ߣ�����x��y�����꼯��
function [x_res, y_res] = bresenham(x0, y0, x1, y1)
% ����x,y�ķ�Χ
x_range = x1 - x0;
y_range = y1 - y0;
% ����б��
m = y_range / x_range;
% ����б�ʴ�Сִ�в�ͬ����
if abs(m) < 1
    slope = 1;
else
    slope = 0;
    [x0, y0] = swap(x0, y0);
    [x_range, y_range] = swap(x_range, y_range);
end
if m < 0
    sign = -1;
else
    sign = 1;
end
% ���㳣���Լ���ʼ���߱���
c1 = 2 * y_range;
c2 = c1 - 2 * x_range;
p = c1 - x_range;

y = y0;

% ����ֵ
x_res = [x0];
y_res = [y0];
% ѭ�����������
for x = x0:(x1-1)
    if p < 0
        if slope == 1
            x_res = [x_res, x+1];
            y_res = [y_res, y];
        else
            x_res = [x_res, y];
            y_res = [y_res, x+1];
        end
        p = p + c1;
    else
        y = y + sign;
        if slope == 1
            x_res = [x_res, x+1];
            y_res = [y_res, y];
        else
            x_res = [x_res, y];
            y_res = [y_res, x+1];
        end
        p = p + c2;
    end
end
end

function [a,b] = swap(a, b)
a = a + b;
b = a - b;
a = a - b;
end

