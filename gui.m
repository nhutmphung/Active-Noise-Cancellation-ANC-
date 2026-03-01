

%{

MATLAB UI FUNCTIONS 

uifigure      % Create figure window - NO TOOLBOX NEEDED
uislider      % Slider widget - NO TOOLBOX NEEDED
uibutton      % Button widget - NO TOOLBOX NEEDED
uilabel       % Text label - NO TOOLBOX NEEDED
uitextarea    % Text box - NO TOOLBOX NEEDED

%}
function gui()
    
    %window intialization
    fig = uifigure('Name','FxLMS_Window', 'Position', [100 100 400 300]);
    
    %slider 
    slider = uislider(fig, 'Position', [50 200 300 3]);
    slider.Limits = [0 1];
    slider.Value = 0.5;

    % Create label to show slider value
    lbl = uilabel(fig, 'Position', [100 230 200 22]);
    lbl.Text = sprintf('Learning Rate (mu): %.3f', slider.Value);

    %FxLMS button run
    button1 = uibutton(fig, 'Position', [50 100 140 40]);
    button1.Text = 'Run FxLMS Algorithm';
    button1.FontSize = 12;
    button1.FontName = 'Helvetica';
    button1.FontWeight = 'bold';
    button1.FontColor = [1,1,1];
    button1.BackgroundColor = [0.2, 0.5, .9];

    %LMS button run     
    button2 = uibutton(fig, 'Position', [200 100 140 40]);
    button2.Text = 'Run LMS Algorithm'; 
    button2.FontSize = 12;
    button2.FontName = 'Helevetica';
    button2.FontWeight = 'bold';
    button2.FontColor = [1,1,1];
    button2.BackgroundColor = [.9 .2 .2];

    text = uitextarea(fig, 'Position', [150 20 100 60]);
    text.Value = 'Click a button to start the ANC';

    slider.ValueChangedFcn =  @(slider, event) sliderMoved(slider, lbl);

    button1.ButtonPushedFcn = @(btn, event) option1Pressed(slider, text);

    button2.ButtonPushedFcn = @(btn, event) option2Pressed(slider, text); 

end

function sliderMoved(slider, lbl)
    lbl.Text = sprinft('Learning Rate: %.3f', slider.Value); 
end 

function option1Pressed(slider, text) 
    mu = slider.Value; 
    text.Value = sprintf("FxLMS with Mu = %.3f", slider.Value);
    pause(.5); 
    text.Value = sprintf("FxLMS Completed.");
end

function option2Pressed(slider, text) 
    mu = slider.Value;
    text.Value = sprintf("LMS with Mu = %.3f", slider.Value);
    pause(.5); 
    text.Value = sprinf("LMS Completed.");
end

