classdef edit_field_2_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure      matlab.ui.Figure
        EnterSomeTextHereEditFieldLabel  matlab.ui.control.Label
        InputText     matlab.ui.control.EditField
        OutputText    matlab.ui.control.Label
        SubmitButton  matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: SubmitButton
        function SubmitButtonPushed(app, event)
            value = app.InputText.Value;
            app.OutputText.Text = char(value);
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

            % Create EnterSomeTextHereEditFieldLabel
            app.EnterSomeTextHereEditFieldLabel = uilabel(app.UIFigure);
            app.EnterSomeTextHereEditFieldLabel.HorizontalAlignment = 'right';
            app.EnterSomeTextHereEditFieldLabel.Position = [12 441 124 22];
            app.EnterSomeTextHereEditFieldLabel.Text = 'Enter Some Text Here';

            % Create InputText
            app.InputText = uieditfield(app.UIFigure, 'text');
            app.InputText.Position = [151 441 475 22];

            % Create OutputText
            app.OutputText = uilabel(app.UIFigure);
            app.OutputText.Position = [15 407 607 22];
            app.OutputText.Text = 'Result will be shown here';

            % Create SubmitButton
            app.SubmitButton = uibutton(app.UIFigure, 'push');
            app.SubmitButton.ButtonPushedFcn = createCallbackFcn(app, @SubmitButtonPushed, true);
            app.SubmitButton.Position = [526 386 100 22];
            app.SubmitButton.Text = 'Submit!';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = edit_field_2_exported

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