import App from 'resource:///com/github/aylur/ags/app.js';
import Widget from 'resource:///com/github/aylur/ags/widget.js';
import Variable from 'resource:///com/github/aylur/ags/variable.js';
import Battery from 'resource:///com/github/aylur/ags/service/battery.js';

const MyBar = (monitor = 0) => Widget.Windows({
   name: 'bar-${monitor}',
   anchor: :
