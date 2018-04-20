%% 求经验分布函数并画出经验分布函数图
a=[141 148 132 138 154 142 150 146 155 158
    150 140 147 148 144 150 149 145 149 158
    143 141 144 144 126 140 144 142 141 140
    145 135 147 146 141 136 140 146 142 137
    148 154 137 139 143 140 131 143 141 149
    148 135 148 152 143 144 141 143 147 146
    150 132 142 142 143 153 149 146 149 138
    142 149 142 137 134 144 146 147 140 142
    140 137 152 145 0 0 0 0 0 0];
a=nonzeros(a);
[ycdf,xcdf,n]=cdfcalc(a);
cdfplot(a);
hold on;
plot(xcdf,ycdf(2:end),':');
hold off;