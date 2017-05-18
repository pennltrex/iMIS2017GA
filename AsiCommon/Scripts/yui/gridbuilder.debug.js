/*!
Copyright (c) 2007, Yahoo! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.yahoo.net/yui/license.txt
version: 2.2.0
*/

var txt = '&nbsp;';

YAHOO.CSSGridBuilder = function() {}

YAHOO.CSSGridBuilder.init = function() {
    this.rows = [];
    this.rows[0] = $('splitBody0');
    this.storeCode = false;
    this.zoneCounter = 1;
    this.bd = $('bd');

    $E.addListener('splitBody0', 'change', YAHOO.CSSGridBuilder.splitBody, YAHOO.CSSGridBuilder, true);
    $E.addListener('addRow', 'click', YAHOO.CSSGridBuilder.addRow, YAHOO.CSSGridBuilder, true);
}
YAHOO.CSSGridBuilder.addRow = function(ev) {
    var tmp = $('splitBody0').cloneNode(true);
    tmp.id = 'splitBody' + this.rows.length;
    this.rows[this.rows.length] = tmp;
    this.rowCounter++;
    var p = $T.create('p', 'Row: ', [$T.create('a', { href: '#', id: 'gridRowDel' + this.rows.length, title: 'Remove this row', style: 'color: red;' }, '[X]'), $T.create('br'),tmp]);
    $('splitBody0').parentNode.parentNode.appendChild(p);
    $E.addListener(tmp, 'change', YAHOO.CSSGridBuilder.splitBody, YAHOO.CSSGridBuilder, true);
    $E.addListener('gridRowDel' + this.rows.length, 'click', YAHOO.CSSGridBuilder.delRow, YAHOO.CSSGridBuilder, true);
    this.splitBody();
    $E.stopEvent(ev);
}
YAHOO.CSSGridBuilder.delRow = function(ev) {
    var tar = $E.getTarget(ev);
    var id = tar.id.replace('gridRowDel', '');
    $('splitBody0').parentNode.parentNode.removeChild(tar.parentNode);
    this.rows[id] = false;
    this.splitBody();
    $E.stopEvent(ev);
}
YAHOO.CSSGridBuilder.doTemplate = function() {
    if (this.storeCode) {
        this.splitBody();
    }
    var str = '<p>' + $T.stringRepeat(txt, 3) + '</p>';
    if (this.storeCode && !this.bodySplit) {
        str = '{0}';
    }
    if (this.bodySplit) {
        if (this.storeCode) {
            str = this.bodySplit;
            var index = str.indexOf('{0}');
            while (index >= 0)
            {
                str = str.slice(0,index) + '{' + (this.zoneCounter - 1) + '}' + str.substr(index + 3);
                this.zoneCounter++;
                index = str.indexOf('{0}');
            }
            //str = $T.printf(this.bodySplit, "\t" + '<asp:webpartzone id="Zone' + this.zoneCounter + '" runat="server" headertext="Zone ' + this.zoneCounter + '"><zonetemplate></zonetemplate></asp:webpartzone>' + "\n\t");
        } else {
            str = $T.printf(this.bodySplit, '<p>' + txt + '</p>');
        }
    }
    if (this.storeCode) {
        return str;
    } else {
        this.bd.innerHTML = str;
    }
}
YAHOO.CSSGridBuilder.getCode = function() {
    this.storeCode = true;
    this.zoneCounter = 1;
    
    // Required div to contain the Bootstrap grids
    code = '   <div>' + "\n\t" + this.doTemplate(true) + "\n\t" + '</div>' + "\n";
   
    this.storeCode = false;
    
    return code;
}
YAHOO.CSSGridBuilder.getSplitList = function() {
    var answer = "";
    for (var i = 0; i < this.rows.length; i++) {
        if ($('splitBody' + i))
            answer = answer + $('splitBody' + i).value + ",";
    }
    return answer.substr(0,answer.length - 1);
}
YAHOO.CSSGridBuilder.splitBody = function() {
    this.bodySplit = '';
    for (var i = 0; i < this.rows.length; i++) {
        this.splitBodyTemplate($('splitBody' + i));
    }
    if (!this.storeCode) {
        this.doTemplate();
        saveCode();
    }
}
YAHOO.CSSGridBuilder.splitBodyTemplate = function(tar) {
    if (tar) {
        var bSplit  = tar.options[tar.selectedIndex].value;
        var str = '';
        switch (bSplit) {
            case '1':
                str += '<div class="row">' + "\n";
                str += '    <div class="col-sm-12">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '</div>' + "\n";
                break;
            case '2':
                str += '<div class="row">' + "\n";
                str += '    <div class="col-sm-6">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '    <div class="col-sm-6">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '</div>' + "\n";
                break;
            case '3':
                str += '    <div class="row">' + "\n";
                str += '        <div class="col-sm-4">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '        <div class="col-sm-4">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '        <div class="col-sm-4">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '    </div>' + "\n";
                break;
            case '4':
                str += '<div class="row">' + "\n";
                str += '        <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '        <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '        <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '        <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '</div>' + "\n";
                break;
            case '5':
                str += '    <div class="row">' + "\n";
                str += '        <div class="col-sm-6">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '        <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '        <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '    </div>' + "\n";
                break;
            case '6':
                str += '    <div class="row">' + "\n";
                str += '        <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '        <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '        <div class="col-sm-6">' + "\n";
                str += '{0}';
                str += '        </div>' + "\n";
                str += '    </div>' + "\n";
                break;
            case '7':
                str += '<div class="row">' + "\n";
                str += '    <div class="col-sm-8">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '    <div class="col-sm-4">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '</div>' + "\n";
                break;
            case '8':
                str += '<div class="row">' + "\n";
                str += '    <div class="col-sm-4">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '    <div class="col-sm-8">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '</div>' + "\n";
                break;
            case '9':
                str += '<div class="row">' + "\n";
                str += '    <div class="col-sm-9">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '    <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '</div>' + "\n";
                break;
            case '10':
                str += '<div class="row">' + "\n";
                str += '    <div class="col-sm-3">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '    <div class="col-sm-9">' + "\n";
                str += '{0}';
                str += '    </div>' + "\n";
                str += '</div>' + "\n";
                break;
        }
        if (!this.storeCode) {
            this.bodySplit += '<div id="gridBuilder' + (this.rows.length - 1) + '">' + str + '</div>';
        } else {
            this.bodySplit += str;
        }
    }
}

