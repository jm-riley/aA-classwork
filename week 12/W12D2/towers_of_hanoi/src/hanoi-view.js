
class View {
    constructor(game, $el) {
        this.game = game;
        this.$el = $el;
        this.setupTowers();
        this.render();
        this.fromTower = null;
        this.$el.on('click', 'ul', this.clickTower.bind(this));
    }

    setupTowers() {
        for (let i = 0; i < 3; i++) {
            let $ul = $('<ul>');
            this.$el.append($ul);
        }
        const firstUl = $('ul')[0];
        const $firstUl = $(firstUl);
        // debugger
        const $large = $('<li>').addClass('large');
        const $medium = $('<li>').addClass('medium');
        const $small = $('<li>').addClass('small');;
        $firstUl.append($small);
        $firstUl.append($medium);
        $firstUl.append($large);
        
    }

    render() {

    }

    clickTower(event) {
        event.stopPropagation();
        const $tower = $(event.currentTarget);
        // debugger
        if (this.fromTower === null) {
            this.fromTower = $tower
            // debugger
        } else {
            this.game.move(this.fromTower.index(), $tower.index());


            debugger
            this.fromTower = null;
        }
        // debugger
    }
}

module.exports = View;