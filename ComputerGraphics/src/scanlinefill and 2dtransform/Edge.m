classdef Edge < handle
    % ���࣬���ڴ���ߵ���Ϣ
    
    properties
        x_low
        dx
        y_max
        next
    end
    
    methods
        function obj = Edge(x_low, dx, y_max)
            %EDGE ��������ʵ��
            if nargin > 2
                obj.x_low = x_low;
                obj.dx = dx;
                obj.y_max = y_max;
            end
        end
        
        function setNext(obj, next)
            % ������һ����
            obj.next = next;
        end
        
        function [next] = getNext(obj)
            % �����һ����
            next = obj.next;
        end
        
        function [x_low] = getXLow(obj)
            % �����͵��Ӧ��xֵ
            x_low = obj.x_low;
        end

        function [y_max] = getYMax(obj)
            % ���y���ֵ
            y_max = obj.y_max;
        end

        function [dx] = getDx(obj)
            % ���x������
            dx = obj.dx;
        end
    end
end

