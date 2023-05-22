function [pair_list, acc] = MatchSync(Xs, gt_list)
    [node_num, graph_num] = size(gt_list);
    dimGroup = ones(graph_num, 1) * node_num;

    [X, ~, ~] = mmatch_spectral(Xs, dimGroup, node_num);
    pair_list = [];
    for i = 1:graph_num
        P = X((i-1)*node_num+1:i*node_num, 1:node_num);
        [~, idx] = max(P, [], 1);
        pair_list = cat(2, pair_list, idx');
    end

    acc = eval_acc(gt_list, pair_list);
end
