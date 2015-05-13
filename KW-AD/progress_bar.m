function progress_bar(spot,mn,mx)
% PROGRESS_BAR can be inserted into a for loop as a method of externally
% keeping track of progress. spot should be the current increment, with min
% and max noting the minimum and maximum values of spot in the loop. 

% Try not to put anything output (fprintf, sprintf, etc) inside the loop,
% as it will disrupt progress_bar. In addition, progress_bar only works
% correctly if it is called throughout the entire for loop, rather than
% entering partway through. 

if spot >= mn && spot <= mx
    if spot == mn
        fprintf('\nProgress: [          ]   0%%');
    elseif spot == round(mx/10)*1
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [=         ]  10%%');
    elseif spot == round(mx/10)*2
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [==        ]  20%%');    
    elseif spot == round(mx/10)*3
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [===       ]  30%%');
    elseif spot == round(mx/10)*4
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [====      ]  40%%');
    elseif spot == round(mx/10)*5
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [=====     ]  50%%');
    elseif spot == round(mx/10)*6
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [======    ]  60%%');
    elseif spot == round(mx/10)*7
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [=======   ]  70%%');
    elseif spot == round(mx/10)*8
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [========  ]  80%%');
    elseif spot == round(mx/10)*9
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [========= ]  90%%');
    elseif spot == mx
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProgress: [==========] 100%% Finished.\n');
    end
else
    fprintf('progress_bar.m function not placed or set up properly.\n');
end

end