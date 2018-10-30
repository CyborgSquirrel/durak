extends Node

const PORT = 414141
const MAX_PEERS = 5


var players = {}
var self_data = {name = ""}


func _ready():
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")


func on_host_server(player_nickname):
	self_data.name = player_nickname
	players[1] = self_data
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(PORT, MAX_PEERS)
	get_tree().set_network_peer(peer)


func on_join_server(ip, player_nickname):
	self_data.name = player_nickname
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	var peer = NetworkedMultiplayerPeer.new()
	peer.create_client(ip, PORT)
	get_tree().set_network_peer(peer)


func _connected_to_server():
	var local_player_id = get_tree().get_network_unique_id()
	player[local_player_id] = self_data
	rpc("_send_player_info", local_player_id, self_data)


func _player_disconnected(id):
	players.erase(id)


remote func _send_player_info(id, info):
	if get_tree().is_network_server():
		for peer_id in players:
			rpc_id(id, "_send_player_info", peer_id, player[peer_id])
	
	players[id] = info


# PENTRU A DA UPDATE LA INFORAMIILE PLAYER-ILOR
func update_info():
	pass