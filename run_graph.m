function void = run_graph(benchmark)
    graph_util = Graph_Util;
    graph_util = graph_util.init(benchmark);
    
    graph_util.graphTrajs();
    graph_util.graphTrajs2d();
    graph_util.graphSpacecraftPos(0);
    graph_util.graphFuel();
end