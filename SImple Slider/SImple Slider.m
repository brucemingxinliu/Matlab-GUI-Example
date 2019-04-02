classdef slider_example_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        Slider1Label           matlab.ui.control.Label
        Slider1                matlab.ui.control.Slider
        HorizontalSliderLabel  matlab.ui.control.Label
        Slider1_2Label         matlab.ui.control.Label
        Slider2                matlab.ui.control.Slider
        VerticalSliderLabel    matlab.ui.control.Label
        ValueHorizontalSliderEditFieldLabel  matlab.ui.control.Label
        Result1                matlab.ui.control.EditField
        ValueVerticalSliderEditFieldLabel  matlab.ui.control.Label
        Result2                matlab.ui.control.EditField
        GuideLabel             matlab.ui.control.Label
        MoveHorizontalSliderfromLefttoRightLabel  matlab.ui.control.Label
        MoveVerticalSliderfromBottomtoTopLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changing function: Slider1
        function Slider1ValueChanging(app, event)
            changingValue = event.Value;
            app.Result1.Value = char(int2str(changingValue));
        end

        % Value changing function: Slider2
        function Slider2ValueChanging(app, event)
            changingValue = event.Value;
            app.Result2.Value = char(int2str(changingValue));
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Create Slider1Label
            app.Slider1Label = uilabel(app.UIFigure);
            app.Slider1Label.HorizontalAlignment = 'right';
            app.Slider1Label.Position = [14 422 46 22];
            app.Slider1Label.Text = 'Slider 1';

            % Create Slider1
            app.Slider1 = uislider(app.UIFigure);
            app.Slider1.ValueChangingFcn = createCallbackFcn(app, @Slider1ValueChanging, true);
            app.Slider1.Position = [81 431 533 3];

            % Create HorizontalSliderLabel
            app.HorizontalSliderLabel = uilabel(app.UIFigure);
            app.HorizontalSliderLabel.FontWeight = 'bold';
            app.HorizontalSliderLabel.Position = [11 454 101 18];
            app.HorizontalSliderLabel.Text = 'Horizontal Slider';

            % Create Slider1_2Label
            app.Slider1_2Label = uilabel(app.UIFigure);
            app.Slider1_2Label.HorizontalAlignment = 'right';
            app.Slider1_2Label.Position = [8 166 46 22];
            app.Slider1_2Label.Text = 'Slider 1';

            % Create Slider2
            app.Slider2 = uislider(app.UIFigure);
            app.Slider2.Orientation = 'vertical';
            app.Slider2.ValueChangingFcn = createCallbackFcn(app, @Slider2ValueChanging, true);
            app.Slider2.Position = [75 175 3 150];

            % Create VerticalSliderLabel
            app.VerticalSliderLabel = uilabel(app.UIFigure);
            app.VerticalSliderLabel.FontWeight = 'bold';
            app.VerticalSliderLabel.Position = [11 335 101 22];
            app.VerticalSliderLabel.Text = 'Vertical Slider';

            % Create ValueHorizontalSliderEditFieldLabel
            app.ValueHorizontalSliderEditFieldLabel = uilabel(app.UIFigure);
            app.ValueHorizontalSliderEditFieldLabel.HorizontalAlignment = 'right';
            app.ValueHorizontalSliderEditFieldLabel.Position = [364 302 135 69];
            app.ValueHorizontalSliderEditFieldLabel.Text = 'Value (Horizontal Slider)';

            % Create Result1
            app.Result1 = uieditfield(app.UIFigure, 'text');
            app.Result1.HorizontalAlignment = 'right';
            app.Result1.FontSize = 56;
            app.Result1.Position = [514 301 100 70];
            app.Result1.Value = '0';

            % Create ValueVerticalSliderEditFieldLabel
            app.ValueVerticalSliderEditFieldLabel = uilabel(app.UIFigure);
            app.ValueVerticalSliderEditFieldLabel.HorizontalAlignment = 'right';
            app.ValueVerticalSliderEditFieldLabel.Position = [364 222 135 69];
            app.ValueVerticalSliderEditFieldLabel.Text = 'Value (Vertical Slider)';

            % Create Result2
            app.Result2 = uieditfield(app.UIFigure, 'text');
            app.Result2.HorizontalAlignment = 'right';
            app.Result2.FontSize = 56;
            app.Result2.Position = [514 221 100 70];
            app.Result2.Value = '0';

            % Create GuideLabel
            app.GuideLabel = uilabel(app.UIFigure);
            app.GuideLabel.Position = [145 175 41 22];
            app.GuideLabel.Text = 'Guide:';

            % Create MoveHorizontalSliderfromLefttoRightLabel
            app.MoveHorizontalSliderfromLefttoRightLabel = uilabel(app.UIFigure);
            app.MoveHorizontalSliderfromLefttoRightLabel.Position = [145 154 237 22];
            app.MoveHorizontalSliderfromLefttoRightLabel.Text = '1. Move Horizontal Slider from Left to Right';

            % Create MoveVerticalSliderfromBottomtoTopLabel
            app.MoveVerticalSliderfromBottomtoTopLabel = uilabel(app.UIFigure);
            app.MoveVerticalSliderfromBottomtoTopLabel.Position = [145 133 232 22];
            app.MoveVerticalSliderfromBottomtoTopLabel.Text = '2. Move Vertical Slider from Bottom to Top';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = slider_example_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end