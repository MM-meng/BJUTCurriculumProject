function [x_res, y_res] = bre(x0, y0, x1, y1)
% ˼·��
% ȫ��תΪ0<=k<=1�����������
% �����������������Ҫ����x,y��λ�û��Ƕ�x,yȡ�෴��
% ͨ���ݹ���0<=k<=1����µĵ����꣬�ٽ�������ȡ�෴������ԭ�����

% �����ԣ�Ч�ʲ��ߣ�����dda����˼·ֻ���ο�

x_range = x1 - x0; % ����x,y�ķ�Χ
y_range = y1 - y0;

x_flag = 0; % x,y������ʶ��
y_flag = 0;

k = y_range / x_range; % ����б��

% ��ֹ����
if x_range > 0 && y_range > 0 && k <= 1 && k >= 0
    c1 = -2 * y_range; % ���㳣��
    c2 = 2 * x_range + c1;
    
    p = x_range + c1; % ������߱�����ʼֵ
    
    y = y0; % y�ĳ�ʼֵ
    
    x_res = [x0]; % �����
    y_res = [y0];
    
    for x = x0 : x1-1 % �ӵڶ����㿪ʼѭ��
        x_res = [x_res, x + 1];
        if p <= 0
            y = y + 1;
            p = p + c2;
        else
            p = p + c1;
        end
        y_res = [y_res, y]; % �������м�������
    end
    return
end

% �����������
if x_range < 0 % ���x��ֵС��0����ȡ�෴��
    x0 = -x0;
    x1 = -x1;
    x_flag = 1;
end

if y_range < 0 % ���y��ֵС��0����ȡ�෴��
    y0 = -y0;
    y1 = -y1;
    y_flag = 1;
end

if abs(k) > 1 % ���k����ֵ����1�� �򽻻�x��y����
    [x, y] = bre(y0, x0, y1, x1);
    x_res = y;
    y_res = x;
else % ���򣬼�k�ʣ�-1,1��������������
    [x_res, y_res] = bre(x0, y0, x1, y1);
end

if x_flag % ���xȡ���෴�������ÿһ��ȡ�෴��
    for i = 1 : length(x_res)
        x_res(i) = -x_res(i); 
    end
end

if y_flag % ���yȡ���෴�������ÿһ��ȡ�෴��
    for i = 1 : length(y_res)
        y_res(i) = -y_res(i);
    end
end
end


