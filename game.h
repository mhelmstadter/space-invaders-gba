// Structs used in gameplay
typedef struct {
	int row; 
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int bulletTimer;
} PLAYER;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int active;
	int aniState;
	int aniCounter;
	int curFrame;
	int numFrames;
} ENEMY;

typedef struct {
	int row;
	int col;
	int rdel;
	int width;
	int height;
	int active;
	int sheetCol;
} BULLET;


// Prototypes
void initGame();
void initPlayer();
void initPlayerBullets();
void drawGame();
void drawPlayer();
void drawEnemy();
void drawBullet();
void updateGame();
void updatePlayer();
void updateEnemy();
void updateBullet();
void shoot();
void initEnemies();


// Definitions
#define ENEMYCOUNT 25
extern ENEMY enemies[ENEMYCOUNT];

#define BULLETCOUNT 5
extern BULLET playerBullets[BULLETCOUNT];
