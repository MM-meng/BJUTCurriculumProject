% ɨ��������㷨
function scan_line(x, y, color)
if length(x) ~= length(y) % ��������һ�£�����
    disp("x��y������Ӧ����һ�£�");
    return
end

x = [x, x(1)]; % Ϊ�˱�֤����αպϣ�����һ�����������ĩβ
y = [y, y(1)];

y_min_all = min(y); % �����е���y����Сֵ��y�����ֵ
y_max_all = max(y);

y_base = y_min_all - 1; % �߱���С����

y_size = y_max_all - y_min_all; % ��߱��С
etable = EdgeTable(y_size); % ʵ�����߱�

for i=1:length(x)-1 % �����߱�
    x0 = x(i); % ��ǰ������һ����
    y0 = y(i);
    x1 = x(i+1);
    y1 = y(i+1);
    plot([x0 x1], [y0 y1], "r");
    hold on;
    
    if y1 - y0 == 0 % ����б��Ϊ0���������ˮƽ�ߣ���ʱ��ֱ�߲�����߱�
        continue;
    elseif x1 - x0 == 0 % ����б�ʲ����ڵ����������ֱ��
        dx = 0;
        x_low = x0;
    else
        dx = (x1 - x0) / (y1 - y0); % һ���������1/k
        if sign(dx) == -1 % ������½����ƣ���x��СֵΪx_min������Ϊx_max
            x_low = max(x0, x1);
        else
            x_low = min(x0, x1);
        end
    end
    
    y_max = max(y0, y1) - 1; % ���������y�����ֵ����ΪҪȥ�����㣬���������һ
    y_min = min(y0, y1); % ���������y����Сֵ
    
    e = Edge(x_low, dx, y_max); % ʵ����һ���µıߣ�������͵��xֵ��x�仯�ʣ��Լ�y�����ֵ
    etable.addEdge(y_min - y_base, e); % �ڱ߱��м���������
end

aet = zeros(1,3); % ��߱����
aet_num = 1; % ��߱�����бߵ�������Ĭ��Ϊ1
y_fill = y_min_all; % �������λ�ã���ʼΪ��Сyֵ��
for y_cyc_var = 1 : y_size 
    e = etable.getEdge(1, y_cyc_var); % ��õ�ǰyֵ��Ӧ����
    if ~isempty(e) % �����
        aet(aet_num,:) = [e.getXLow(), e.getDx(), e.getYMax()]; % �ھ������������
        aet_num = aet_num + 1; % ��������һ
    
        while ~isempty(e.getNext()) % ������������ߣ���ôҲ��ӵ�������ȥ
            e = e.getNext();
            aet(aet_num,:) = [e.getXLow(), e.getDx(), e.getYMax()];
            aet_num = aet_num + 1;
        end
    end
    
    aet = sortrows(aet, 1);% �����յ�һ������
    for i = 1 : 2: length(aet)/2 + 1 % ������䣬�ܳ��ȳ�2������Ϊ2
        for p = ceil(aet(i, 1)) : floor(aet(i+1, 1))
            plot(p,  y_fill, color);
        end
        hold on;
        grid on;
    end

    f = find(aet(:,3) == y_fill); % Ѱ�ҵ�ǰ�ﵽy_max��ֱ��
    if ~isempty(f) % �����
        aet(f,:) = []; % ������ɾ��
        aet_num = aet_num - 1; % ��������һ
    end

    aet(:,1) = aet(:,1) + aet(:,2); % x����
    y_fill = y_fill + 1; % ���λ������
end
