% �Ƚ����ַ��������ܣ�����ʱ��
function [t1, t2] = compare(times)
r = randperm(times);
x = randperm(times);
y = randperm(times);
tic
for i = 1 : times
    [~, ~] = mid_point(x(i), y(i), r(i));
end
t1 = toc;
tic
for i = 1 : times
    [~, ~] = mid_point_second(x(i), y(i), r(i));
end
t2 = toc;
end

