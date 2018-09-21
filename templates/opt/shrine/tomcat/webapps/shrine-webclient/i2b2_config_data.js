{
  urlProxy: "/shrine-proxy/request",
  urlFramework: "js-i2b2/",
  loginTimeout: 15, // in seconds
  username_label:"{{ shrine_node_name }} username:", //Username Label
  password_label:"{{ shrine_node_name }} password:", //Password Label
  clientHelpUrl:'help/pdf/shrine-client-guide.pdf',
  networkHelpUrl:'help/pdf/shrine-network-guide.pdf',
  wikiBaseUrl:'https://open.med.harvard.edu/wiki/display/SHRINE',  
  // -------------------------------------------------------------------------------------------
  // THESE ARE ALL THE DOMAINS A USER CAN LOGIN TO
  lstDomains: [
    { 
      domain: "{{ shrine_i2b2_domain }}",
      name: "{{ shrine_node_name }}",
      debug: true,
      urlCellPM: "{{ ['http://', i2b2_cell.Pmdata.ip, '/i2b2/services/PMService/'] | join }}",
      allowAnalysis: true{% if using_shrine_steward | bool and steward_topic_mode != 'TopicsIgnoredJustLog' %},
      isSHRINE: true{% endif %}
      
    }
  ]
  // -------------------------------------------------------------------------------------------
}
