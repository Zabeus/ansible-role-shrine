// this file contains a list of all files that need to be loaded dynamically for this i2b2 Cell
// every file in this list will be loaded after the cell's Init function is called
{
    files: [
        "SHRINE_ctrl.js",
        "i2b2_msgs.js"
    ],
    css: [],
    config: {
    // additional configuration variables that are set by the system
    name: "SHRINE Cell",
        description: "The SHRINE cell...",
        category: ["core","cell","shrine"],
        newTopicURL: "https://{{ shrine_hostname }}:{{ shrine_ports.https }}/steward/client/index.html#/topics",
        readApprovedURL:"https://{{ shrine_hostname }}:{{ shrine_ports.https }}/shrine/rest/i2b2/request"
    }
}
