// Quims Cartography Table Menu
if (${input$ENTITY} instanceof ServerPlayer player) {
    BlockPos qmp_Pos = player.blockPosition();
    Level lvl = player.level();
    final String qm_title = ${input$TEXT};

    player.openMenu(new MenuProvider() {
        @Override
        public Component getDisplayName() {
            return Component.literal(qm_title);
        }

        @Override
        public AbstractContainerMenu createMenu(int id, Inventory inv, Player playerEntity) {
            return new CartographyTableMenu(
                id,
                inv,
                ContainerLevelAccess.create(lvl, qmp_Pos)
            ) {
                @Override
                public boolean stillValid(Player p) {
                    return true;
                }
            };
        }
    });
}
