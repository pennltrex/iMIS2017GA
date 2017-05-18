function ClientNodeClicked(sender, eventArgs) {
    var node = eventArgs.get_node();
    node.toggle();
}