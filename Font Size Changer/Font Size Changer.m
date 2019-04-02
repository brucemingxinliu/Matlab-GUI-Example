classdef font_size_changer_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        ChangeFontSizeSliderLabel  matlab.ui.control.Label
        ChangeFont                 matlab.ui.control.Slider
        Labeler                    matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            x = app.Labeler.FontSize;
            app.ChangeFont.Value = x;
        end

        % Value changing function: ChangeFont
        function ChangeFontValueChanging(app, event)
            changingValue = event.Value;
            app.Labeler.FontSize = changingValue;
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

            % Create ChangeFontSizeSliderLabel
            app.ChangeFontSizeSliderLabel = uilabel(app.UIFigure);
            app.ChangeFontSizeSliderLabel.HorizontalAlignment = 'right';
            app.ChangeFontSizeSliderLabel.Position = [13 439 102 22];
            app.ChangeFontSizeSliderLabel.Text = 'Change Font Size';

            % Create ChangeFont
            app.ChangeFont = uislider(app.UIFigure);
            app.ChangeFont.ValueChangingFcn = createCallbackFcn(app, @ChangeFontValueChanging, true);
            app.ChangeFont.Position = [136 448 468 3];

            % Create Labeler
            app.Labeler = uilabel(app.UIFigure);
            app.Labeler.HorizontalAlignment = 'center';
            app.Labeler.Position = [29 38 589 336];
            app.Labeler.Text = 'Change Me!';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = font_size_changer_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

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