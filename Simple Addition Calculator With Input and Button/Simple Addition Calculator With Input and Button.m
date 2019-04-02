classdef edit_field_3_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                    matlab.ui.Figure
        FirstNumberEditFieldLabel   matlab.ui.control.Label
        Input1                      matlab.ui.control.NumericEditField
        SecondNumberEditFieldLabel  matlab.ui.control.Label
        Input2                      matlab.ui.control.NumericEditField
        Number1Label                matlab.ui.control.Label
        Number2Label                matlab.ui.control.Label
        DisplayInput1               matlab.ui.control.Label
        DisplayInput2               matlab.ui.control.Label
        GetResultButton             matlab.ui.control.Button
        Label_5                     matlab.ui.control.Label
        ResultLabel                 matlab.ui.control.Label
        DisplayResult               matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: Input1
        function Input1ValueChanged(app, event)
            value = app.Input1.Value;
            app.DisplayInput1.Text = char(int2str(value));
        end

        % Value changed function: Input2
        function Input2ValueChanged(app, event)
            value = app.Input2.Value;
            app.DisplayInput2.Text = char(int2str(value));
        end

        % Button pushed function: GetResultButton
        function GetResultButtonPushed(app, event)
            x = app.Input1.Value;
            y = app.Input2.Value;
            z = x + y;
            app.DisplayResult.Text = char(int2str(z));
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

            % Create FirstNumberEditFieldLabel
            app.FirstNumberEditFieldLabel = uilabel(app.UIFigure);
            app.FirstNumberEditFieldLabel.HorizontalAlignment = 'right';
            app.FirstNumberEditFieldLabel.Position = [216 438 75 22];
            app.FirstNumberEditFieldLabel.Text = 'First Number';

            % Create Input1
            app.Input1 = uieditfield(app.UIFigure, 'numeric');
            app.Input1.Limits = [0 100];
            app.Input1.ValueDisplayFormat = '%.0f';
            app.Input1.ValueChangedFcn = createCallbackFcn(app, @Input1ValueChanged, true);
            app.Input1.Position = [306 438 100 22];

            % Create SecondNumberEditFieldLabel
            app.SecondNumberEditFieldLabel = uilabel(app.UIFigure);
            app.SecondNumberEditFieldLabel.HorizontalAlignment = 'right';
            app.SecondNumberEditFieldLabel.Position = [199 402 92 22];
            app.SecondNumberEditFieldLabel.Text = 'Second Number';

            % Create Input2
            app.Input2 = uieditfield(app.UIFigure, 'numeric');
            app.Input2.Limits = [0 100];
            app.Input2.ValueDisplayFormat = '%.0f';
            app.Input2.ValueChangedFcn = createCallbackFcn(app, @Input2ValueChanged, true);
            app.Input2.Position = [306 402 100 22];

            % Create Number1Label
            app.Number1Label = uilabel(app.UIFigure);
            app.Number1Label.Position = [233 338 58 22];
            app.Number1Label.Text = 'Number 1';

            % Create Number2Label
            app.Number2Label = uilabel(app.UIFigure);
            app.Number2Label.Position = [233 317 58 22];
            app.Number2Label.Text = 'Number 2';

            % Create DisplayInput1
            app.DisplayInput1 = uilabel(app.UIFigure);
            app.DisplayInput1.HorizontalAlignment = 'right';
            app.DisplayInput1.Position = [381 338 25 22];
            app.DisplayInput1.Text = '0';

            % Create DisplayInput2
            app.DisplayInput2 = uilabel(app.UIFigure);
            app.DisplayInput2.HorizontalAlignment = 'right';
            app.DisplayInput2.Position = [381 317 25 22];
            app.DisplayInput2.Text = '0';

            % Create GetResultButton
            app.GetResultButton = uibutton(app.UIFigure, 'push');
            app.GetResultButton.ButtonPushedFcn = createCallbackFcn(app, @GetResultButtonPushed, true);
            app.GetResultButton.Position = [306 368 100 22];
            app.GetResultButton.Text = 'Get Result';

            % Create Label_5
            app.Label_5 = uilabel(app.UIFigure);
            app.Label_5.Position = [216 296 235 22];
            app.Label_5.Text = '------------------------------------------------------- +';

            % Create ResultLabel
            app.ResultLabel = uilabel(app.UIFigure);
            app.ResultLabel.Position = [233 275 40 22];
            app.ResultLabel.Text = 'Result';

            % Create DisplayResult
            app.DisplayResult = uilabel(app.UIFigure);
            app.DisplayResult.HorizontalAlignment = 'right';
            app.DisplayResult.Position = [381 275 25 22];
            app.DisplayResult.Text = '0';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = edit_field_3_exported

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