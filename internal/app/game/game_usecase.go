package game

import (
	"context"
)

type GameUseCase struct {
	gameRepo IGameRepository
}

func (u *GameUseCase) GetGames(ctx context.Context) (games []Game, err error) {
	games, err = u.gameRepo.Find()
	return games, err
}
