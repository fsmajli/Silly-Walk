classdef GUIcode < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        TabGroup                     matlab.ui.container.TabGroup
        singlewalkTab                matlab.ui.container.Tab
        WalklistListBox              matlab.ui.control.ListBox
        WalklistListBoxLabel         matlab.ui.control.Label
        CurrentFileEditField         matlab.ui.control.EditField
        CurrentFileEditFieldLabel    matlab.ui.control.Label
        UITable                      matlab.ui.control.Table
        normalLamp                   matlab.ui.control.Lamp
        SelectFileButton             matlab.ui.control.Button
        WalkLabel                    matlab.ui.control.Label
        UIAxes                       matlab.ui.control.UIAxes
        findallsillywalkTab          matlab.ui.container.Tab
        SillywalksLabel              matlab.ui.control.Label
        UITable2                     matlab.ui.control.Table
        CurrentFileEditField_2       matlab.ui.control.EditField
        CurrentFileEditField_2Label  matlab.ui.control.Label
        SelectFileButton_2           matlab.ui.control.Button
        continuouswalkTab            matlab.ui.container.Tab
        CurrentFileEditField_3       matlab.ui.control.EditField
        CurrentFileEditField_3Label  matlab.ui.control.Label
        SelectFileButton_3           matlab.ui.control.Button
        sillywalddecetedLamp         matlab.ui.control.Lamp
        sillywalddecetedLampLabel    matlab.ui.control.Label
        Knob                         matlab.ui.control.Knob
        UIAxes_2                     matlab.ui.control.UIAxes
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 640 480];

            % Create singlewalkTab
            app.singlewalkTab = uitab(app.TabGroup);
            app.singlewalkTab.Title = 'single walk';

            % Create UIAxes
            app.UIAxes = uiaxes(app.singlewalkTab);
            xlabel(app.UIAxes, 'Relative Time[s]')
            ylabel(app.UIAxes, 'Acceleration[m/s^2]')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [166 94 441 269];

            % Create WalkLabel
            app.WalkLabel = uilabel(app.singlewalkTab);
            app.WalkLabel.FontSize = 20;
            app.WalkLabel.Position = [373 358 167 38];
            app.WalkLabel.Text = 'Walk';

            % Create SelectFileButton
            app.SelectFileButton = uibutton(app.singlewalkTab, 'push');
            app.SelectFileButton.Position = [43 411 82 22];
            app.SelectFileButton.Text = 'Select File';

            % Create normalLamp
            app.normalLamp = uilamp(app.singlewalkTab);
            app.normalLamp.Position = [447 367 20 20];

            % Create UITable
            app.UITable = uitable(app.singlewalkTab);
            app.UITable.ColumnName = {'walk n'; 'X'; 'Y'; 'Z'};
            app.UITable.RowName = {};
            app.UITable.Position = [34 25 573 50];

            % Create CurrentFileEditFieldLabel
            app.CurrentFileEditFieldLabel = uilabel(app.singlewalkTab);
            app.CurrentFileEditFieldLabel.HorizontalAlignment = 'right';
            app.CurrentFileEditFieldLabel.Position = [166 411 68 22];
            app.CurrentFileEditFieldLabel.Text = 'Current File';

            % Create CurrentFileEditField
            app.CurrentFileEditField = uieditfield(app.singlewalkTab, 'text');
            app.CurrentFileEditField.Position = [249 411 358 22];

            % Create WalklistListBoxLabel
            app.WalklistListBoxLabel = uilabel(app.singlewalkTab);
            app.WalklistListBoxLabel.HorizontalAlignment = 'right';
            app.WalklistListBoxLabel.Position = [34 365 49 22];
            app.WalklistListBoxLabel.Text = 'Walk list';

            % Create WalklistListBox
            app.WalklistListBox = uilistbox(app.singlewalkTab);
            app.WalklistListBox.Items = {'walk 1', 'walk 2', 'walk 3', 'walk 4'};
            app.WalklistListBox.Position = [34 113 100 253];
            app.WalklistListBox.Value = 'walk 3';

            % Create findallsillywalkTab
            app.findallsillywalkTab = uitab(app.TabGroup);
            app.findallsillywalkTab.Title = 'find all silly walk';

            % Create SelectFileButton_2
            app.SelectFileButton_2 = uibutton(app.findallsillywalkTab, 'push');
            app.SelectFileButton_2.Position = [43 411 82 22];
            app.SelectFileButton_2.Text = 'Select File';

            % Create CurrentFileEditField_2Label
            app.CurrentFileEditField_2Label = uilabel(app.findallsillywalkTab);
            app.CurrentFileEditField_2Label.HorizontalAlignment = 'right';
            app.CurrentFileEditField_2Label.Position = [166 411 68 22];
            app.CurrentFileEditField_2Label.Text = 'Current File';

            % Create CurrentFileEditField_2
            app.CurrentFileEditField_2 = uieditfield(app.findallsillywalkTab, 'text');
            app.CurrentFileEditField_2.Position = [249 411 358 22];

            % Create UITable2
            app.UITable2 = uitable(app.findallsillywalkTab);
            app.UITable2.ColumnName = {'walk n'; 'X'; 'Y'; 'Z'};
            app.UITable2.RowName = {};
            app.UITable2.Position = [82 39 487 320];

            % Create SillywalksLabel
            app.SillywalksLabel = uilabel(app.findallsillywalkTab);
            app.SillywalksLabel.FontSize = 20;
            app.SillywalksLabel.Position = [277 365 199 25];
            app.SillywalksLabel.Text = 'Silly walks';

            % Create continuouswalkTab
            app.continuouswalkTab = uitab(app.TabGroup);
            app.continuouswalkTab.Title = 'continuous walk';

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.continuouswalkTab);
            xlabel(app.UIAxes_2, 'Relative Time[s]')
            ylabel(app.UIAxes_2, 'Acceleration[m/s^2]')
            zlabel(app.UIAxes_2, 'Z')
            app.UIAxes_2.Position = [34 43 441 344];

            % Create Knob
            app.Knob = uiknob(app.continuouswalkTab, 'continuous');
            app.Knob.Position = [523 113 60 60];

            % Create sillywalddecetedLampLabel
            app.sillywalddecetedLampLabel = uilabel(app.continuouswalkTab);
            app.sillywalddecetedLampLabel.HorizontalAlignment = 'right';
            app.sillywalddecetedLampLabel.Position = [484 217 99 22];
            app.sillywalddecetedLampLabel.Text = 'silly wald deceted';

            % Create sillywalddecetedLamp
            app.sillywalddecetedLamp = uilamp(app.continuouswalkTab);
            app.sillywalddecetedLamp.Position = [598 217 20 20];

            % Create SelectFileButton_3
            app.SelectFileButton_3 = uibutton(app.continuouswalkTab, 'push');
            app.SelectFileButton_3.Position = [43 411 82 22];
            app.SelectFileButton_3.Text = 'Select File';

            % Create CurrentFileEditField_3Label
            app.CurrentFileEditField_3Label = uilabel(app.continuouswalkTab);
            app.CurrentFileEditField_3Label.HorizontalAlignment = 'right';
            app.CurrentFileEditField_3Label.Position = [166 411 68 22];
            app.CurrentFileEditField_3Label.Text = 'Current File';

            % Create CurrentFileEditField_3
            app.CurrentFileEditField_3 = uieditfield(app.continuouswalkTab, 'text');
            app.CurrentFileEditField_3.Position = [249 411 358 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GUIcode

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