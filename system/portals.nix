{ config,pkgs }:{
xdg.portal. = {
	enable = true;
	extraPortals = [
		xdg-desktop-portal-kde
	];
};
}
