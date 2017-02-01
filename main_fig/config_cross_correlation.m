% Cross correlation window configuration
% June 2016
% Hamzeh Sadeghisorkhani


%% Cross correlation panel
h.panel(2)= uipanel(mainfig,'visible','off','Position',[.235 .15 .74 .8]);
set(h.panel(2),'BackgroundColor',panel_color)



%% Text boxes
%-------------------------------- Time Domain Correlation
uicontrol(h.panel(2),'Style','text', 'String','Time Domain Correlation',...
    'HorizontalAlignment','left','Fontweight','bold',...
    'Units','normalized','Position',[.01 .92 .4 .05],...
    'BackgroundColor',panel_color);

uicontrol(h.panel(2),'Style','text', 'String','Component',...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.05 .82 .2 .05],...
    'BackgroundColor',panel_color);

uicontrol(h.panel(2),'Style','text', 'String','tmin',...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.05 .72 .2 .05],...
    'BackgroundColor',panel_color);
uicontrol(h.panel(2),'Style','text', 'String','tmax',...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.3 .72 .2 .05],...
    'BackgroundColor',panel_color);
uicontrol(h.panel(2),'Style','text', 'String','dt',...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.55 .72 .2 .05],...
    'BackgroundColor',panel_color);

uicontrol(h.panel(2),'Style','text', 'String','Velocity filter',...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.05 .64 .2 .05],...
    'BackgroundColor',panel_color);
uicontrol(h.panel(2),'Style','text', 'String','Interval',...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.15 .56 .2 .05],...
    'BackgroundColor',panel_color);
uicontrol(h.panel(2),'Style','text', 'String','km/s',...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.37 .56 .2 .05],...
    'BackgroundColor',panel_color);

uicontrol(h.panel(2),'Style','text', 'String','Whitening',...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.05 .48 .2 .05],...
    'BackgroundColor',panel_color);




%% Editable text 
%-------------------------------- Time Domain Correlation
h2.radiobutton(2)= uibuttongroup(h.panel(2),'units','normalized','BackgroundColor',panel_color,...
    'bordertype','none','Position',[.2 .835 .7 .05]);

h2.radio(3) = uicontrol( h2.radiobutton(2), 'Style','Radio','String','ZZ',...
    'BackgroundColor',panel_color, 'units','normalized','position',[.1 0 .15 1],'HandleVisibility','off');
h2.radio(4) = uicontrol( h2.radiobutton(2), 'Style','Radio','String','ZR',...
    'BackgroundColor',panel_color, 'units','normalized','position',[.25 0 .15 1],'HandleVisibility','off');
h2.radio(5) = uicontrol( h2.radiobutton(2), 'Style','Radio','String','RR',...
    'BackgroundColor',panel_color, 'units','normalized','position',[.4 0 .15 1],'HandleVisibility','off');
h2.radio(6) = uicontrol( h2.radiobutton(2), 'Style','Radio','String','TT',...
    'BackgroundColor',panel_color, 'units','normalized','position',[.55 0 .15 1],'HandleVisibility','off');
h2.radio(16) = uicontrol( h2.radiobutton(2), 'Style','Radio','String','RZ',...
    'BackgroundColor',panel_color, 'units','normalized','position',[.7 0 .15 1],'HandleVisibility','off');

h2.tmin= uicontrol(h.panel(2),'Style','edit', 'String',params.tmin,...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.12 .735 .1 .04],...
    'BackgroundColor','w');
h2.tmax= uicontrol(h.panel(2),'Style','edit', 'String',params.tmax,...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.38 .735 .1 .04],...
    'BackgroundColor','w');
h2.dt= uicontrol(h.panel(2),'Style','edit', 'String',params.dt,...
    'HorizontalAlignment','left',...
    'Units','normalized','Position',[.6 .735 .1 .04],...
    'BackgroundColor','w');


h2.vtaper= uicontrol(h.panel(2),'Style','checkbox', 'String','',...
    'HorizontalAlignment','left','Value',1,...
    'Units','normalized','Position',[.24 .655 .1 .04],...
    'Tag','vtaper',...
    'BackgroundColor',panel_color,'callback',@checkbox_cbk);
h2.vt_inter= uicontrol(h.panel(2),'Style','edit', 'String',params.vt_inter,...
    'HorizontalAlignment','left','Enable','on',...
    'Units','normalized','Position',[.26 .58 .1 .04],...
    'BackgroundColor','w');

h2.white= uicontrol(h.panel(2),'Style','checkbox', 'String','',...
    'HorizontalAlignment','left','Value',1,...
    'Units','normalized','Position',[.24 .495 .1 .04],...
    'BackgroundColor',panel_color);




%% Saving buttons

uicontrol(h.panel(2),'style','pushbutton', 'string','Default',...
    'ToolTipString','Load default setting','Tag','default2',...
    'units','normalized','position',[.1 .03 .18 .07], ...
    'callback',@default_cbk);

uicontrol(h.panel(2),'style','pushbutton', 'string','Latest',...
    'ToolTipString','Load latest setting','Tag','latest2',...
    'units','normalized','position',[.41 .03 .18 .07], ...
    'callback',@latest_cbk);

uicontrol(h.panel(2),'style','pushbutton', 'string','Save',...
    'ToolTipString','Save setting changes','Tag','save2',...
    'units','normalized','position',[.72 .03 .18 .07], ...
    'callback',@save_cbk);


% align([u1 u2 u3],'distribute','bottom');


%% Setting values
if strcmp(params.component,'ZZ')
    set (h2.radio(3),'value',1);
    set (h2.radio(4),'value',0);
    set (h2.radio(5),'value',0);
    set (h2.radio(6),'value',0);
    set (h2.radio(16),'value',0);
elseif strcmp(params.component,'ZR')
    set (h2.radio(3),'value',0);
    set (h2.radio(4),'value',1);
    set (h2.radio(5),'value',0);
    set (h2.radio(6),'value',0);
    set (h2.radio(16),'value',0);
elseif strcmp(params.component,'RR')
    set (h2.radio(3),'value',0);
    set (h2.radio(4),'value',0);
    set (h2.radio(5),'value',1);
    set (h2.radio(6),'value',0);
    set (h2.radio(16),'value',0);
elseif strcmp(params.component,'TT')
    set (h2.radio(3),'value',0);
    set (h2.radio(4),'value',0);
    set (h2.radio(5),'value',0);
    set (h2.radio(6),'value',1);
    set (h2.radio(16),'value',0);
elseif strcmp(params.component,'RZ')
    set (h2.radio(3),'value',0);
    set (h2.radio(4),'value',0);
    set (h2.radio(5),'value',0);
    set (h2.radio(6),'value',0);
    set (h2.radio(16),'value',1);
end
% get(h2.radiobutton(1),'selectedobject')

if strcmp(params.vtaper,'yes')
    set (h2.vtaper,'value',1);    
    set(h2.vt_inter,'Enable','on');
elseif strcmp(params.vtaper,'no')
    set (h2.vtaper,'value',0);    
    set(h2.vt_inter,'Enable','off');
end

if strcmp(params.white,'yes')
    set (h2.white,'value',1);    
elseif strcmp(params.white,'no')
    set (h2.white,'value',0);    
end