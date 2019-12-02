classdef EdgeTable < handle
    % �߱��࣬���ڹ������б�
    
    properties
        size % �߱�Ĵ�С
        edges = {} % һ��Ԫ�����飬�洢���б�
    end
    
    methods
        function obj = EdgeTable(size)
            % ��������ʵ��
            obj.size = size;
            obj.edges(size + 1) = {0};
        end
        
        function addEdge(obj, index, edge)
            % ��߱�����ӱ�
            e = obj.edges{index}; % ���Ԫ�������������ı�
            if ~isempty(e) % ����߲��գ���ôһֱ��������һ��
                while ~isempty(e.getNext())
                    e = e.getNext();
                end
                e.setNext(edge); % �Ըýڵ��next��ֵ
            else
                obj.edges(index) = {edge}; % ����ǿյģ���ֱ�Ӳ���
            end
        end
        
        function [edges] = getEdges(obj)
            % ��ñ߱�
            edges  = obj.edges;
        end
        
        function [edge] = getEdge(obj, row, column)
            % ���ĳһ����
            edge = obj.edges{row, column};
        end
    end
end

