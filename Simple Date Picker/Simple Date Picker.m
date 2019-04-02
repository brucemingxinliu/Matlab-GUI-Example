classdef date_picker_example_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        ExampleforDatePickerLabel  matlab.ui.control.Label
        DatePickerLabel            matlab.ui.control.Label
        DatePicker                 matlab.ui.control.DatePicker
        DateSelectedLabel          matlab.ui.control.Label
        DateSelectedResult         matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: DatePicker
        function DatePickerValueChanged(app, event)
            value = app.DatePicker.Value;
            app.DateSelectedResult.Text = char(value);
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

            % Create ExampleforDatePickerLabel
            app.ExampleforDatePickerLabel = uilabel(app.UIFigure);
            app.ExampleforDatePickerLabel.Position = [14 451 135 22];
            app.ExampleforDatePickerLabel.Text = 'Example for Date Picker';

            % Create DatePickerLabel
            app.DatePickerLabel = uilabel(app.UIFigure);
            app.DatePickerLabel.HorizontalAlignment = 'right';
            app.DatePickerLabel.Position = [13 422 68 22];
            app.DatePickerLabel.Text = 'Date Picker';

            % Create DatePicker
            app.DatePicker = uidatepicker(app.UIFigure);
            app.DatePicker.ValueChangedFcn = createCallbackFcn(app, @DatePickerValueChanged, true);
            app.DatePicker.Position = [96 422 150 22];

            % Create DateSelectedLabel
            app.DateSelectedLabel = uilabel(app.UIFigure);
            app.DateSelectedLabel.FontWeight = 'bold';
            app.DateSelectedLabel.Position = [14 355 88 22];
            app.DateSelectedLabel.Text = 'Date Selected:';

            % Create DateSelectedResult
            app.DateSelectedResult = uilabel(app.UIFigure);
            app.DateSelectedResult.Position = [101 355 297 22];
            app.DateSelectedResult.Text = '<< Select the date >>';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = date_picker_example_exported

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