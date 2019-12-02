% ִ����ת������������;��
% 1����ͼ��ƽ�Ƶ���0,0����Ȼ����ת����ƽ�Ƶ���xc��yc��
% 2�����ݾ�������ֱ�ӵõ���Ӧ����
% ������ת���x��y�����꼯�ϣ�Ӧȫ��ȡ��
function [x_res, y_res] = rotate(xc, yc, x, y, theta, op)
if op == "move"
    [x_t, y_t] = translation(0, 0, x, y);
    res = [cos(theta) -sin(theta); sin(theta) cos(theta)] * [x_t; y_t];
    [x_res, y_res] = translation(xc, yc, res(1,:), res(2,:));
    x_res = round(x_res);
    y_res = round(y_res);
elseif op == "matrix"
    cos_theta = cos(theta);
    sin_theta = sin(theta);
    cor = [x; y];
    cor(3,:) = 1;
    res = [cos_theta -sin_theta xc*(1-cos_theta)+yc*sin_theta;sin_theta cos_theta yc*(1-cos_theta)-xc*sin_theta;0 0 1] * cor;
    x_res = round(res(1,:));
    y_res = round(res(2,:));
end
end

