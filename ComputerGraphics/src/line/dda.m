% ����dda�������ߣ�����x��y�����꼯��
function [x_res, y_res] = dda(x0, y0, x1, y1)
x_range = abs(x1 - x0); % x, y�ķ�Χ
y_range = abs(y1 - y0);

sign_x = sign(x1 - x0); % �������
sign_y = sign(y1 - y0);

steps = max(x_range, y_range); % �ж�x��y�ķ�Χ

step_x = x_range / steps; % ���㲽��
step_y = y_range / steps;

if step_x == 1 % ȷ����������
    x_res = x0 : step_x * sign_x : x1; % �����
    y_res = [];
    
    y = y0; % ������ʼֵ
    
    for x = x_res
        y_res = [y_res, round(y)]; % �������������Ľ��
        y = y + (step_y * sign_y); % ����
    end
    
else
    x_res = []; % �����
    y_res = y0 : step_y * sign_y : y1;
    
    x = x0; % ������ʼֵ
    
    for y = y_res
        x_res = [x_res, round(x)]; % �������������Ľ��
        x = x + (step_x * sign_x); % ����
    end
end
end

