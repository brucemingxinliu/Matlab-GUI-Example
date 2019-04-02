classdef edit_field_1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure    matlab.ui.Figure
        EntersomeTexthereEditFieldLabel  matlab.ui.control.Label
        inputText   matlab.ui.control.EditField
        outputText  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changing function: inputText
        function inputTextValueChanging(app, event)
            changingValue = event.Value;
            app.outputText.Text = char(changingValue);
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

            % Create EntersomeTexthereEditFieldLabel
            app.EntersomeTexthereEditFieldLabel = uilabel(app.UIFigure);
            app.EntersomeTexthereEditFieldLabel.HorizontalAlignment = 'right';
            app.EntersomeTexthereEditFieldLabel.Position = [16 444 121 22];
            app.EntersomeTexthereEditFieldLabel.Text = 'Enter some Text here';

            % Create inputText
            app.inputText = uieditfield(app.UIFigure, 'text');
            app.inputText.ValueChangingFcn = createCallbackFcn(app, @inputTextValueChanging, true);
            app.inputText.Position = [151 444 479 22];

            % Create outputText
            app.outputText = uilabel(app.UIFigure);
            app.outputText.Position = [24 411 602 22];
            app.outputText.Text = 'Result will be shown here';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = edit_field_1_exported

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