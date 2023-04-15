#include "Main.h"


#define OLC_PGE_APPLICATION
#define OLC_GFX_OPENGL33
#define OLC_IMAGE_STB
#include "olcPixelGameEngine.h"
#define OLC_PGEX_TRANSFORMEDVIEW
#include "olcPGEX_TransformedView.h"

#include "glm/glm.hpp"
#include "glm/gtc/matrix_transform.hpp"
#include "glm/gtx/type_trait.hpp"
#include "glm/gtc/type_ptr.hpp"
#include "glm/gtx/string_cast.hpp"
#include "glm/gtx/euler_angles.hpp"


using Vec2 = glm::vec2;
using Vec3 = glm::vec3;
using Vec4 = glm::vec4;
using Mat4 = glm::mat4x4;
using Mat3 = glm::mat3x3;

class Example : public olc::PixelGameEngine
{
public:
	Example()
	{
		sAppName = "Example";

		m_tv.Initialise({ScreenWidth(), ScreenHeight()});
	}

public:
	bool OnUserCreate() override
	{
		m_sprite = new olc::Sprite("figure_180x180_framed_standard_146_high_elf_royal_guard.png");
		m_decal = new olc::Decal(m_sprite);

		m_kidSprite = new olc::Sprite("StG_44.png");
		m_kidDecal = new olc::Decal(m_kidSprite);

		return true;
	}

	bool OnUserUpdate(float fElapsedTime) override
	{
		Clear(olc::WHITE);
	
		m_rotation += fElapsedTime;

		m_position = { GetMousePos().x, GetMousePos().y };

		position = { m_kidDecal->sprite->width / 2.0f, m_kidDecal->sprite->height / 2.0f };

		// Calculate child position.
		Mat4 parent_tr = glm::translate(Mat4(1.0f), Vec3(m_position, 0.0f))*

						 glm::rotate(Mat4(1.0f), m_rotation, Vec3(0.0f, 0.0f, 1.0f))*

						 glm::scale(Mat4(1.0f), Vec3(Vec2{1.0f, 1.0f}, 1.0f));


		Mat4 child_tr = glm::translate(Mat4(1.0f), Vec3(position, 0.0f)) *

						glm::rotate(Mat4(1.0f), rotation, Vec3(0.0f, 0.0f, 1.0f)) *

						glm::scale(Mat4(1.0f), Vec3(scale, 1.0f));

		Vec3 parent_position = Vec3(parent_tr[3]);
		
		Vec3 parent_rotation;
		glm::extractEulerAngleXYZ(parent_tr, parent_rotation.x, parent_rotation.y, parent_rotation.z);

		Vec3 parent_scale = Vec3(
			glm::length(Vec3(parent_tr[0])),
			glm::length(Vec3(parent_tr[1])),
			glm::length(Vec3(parent_tr[2]))
		);


		child_tr = parent_tr * child_tr;

		Vec3 kid_position = Vec3(child_tr[3]);
		
		Vec3 kid_rotation;
		glm::extractEulerAngleXYZ(child_tr, kid_rotation.x, kid_rotation.y, kid_rotation.z);

		Vec3 kid_scale = Vec3(
			glm::length(Vec3(child_tr[0])),
			glm::length(Vec3(child_tr[1])),
			glm::length(Vec3(child_tr[2]))
		);



		DrawRotatedDecal({ parent_position.x, parent_position.y }, m_decal, parent_rotation.z, { m_decal->sprite->width / 2.0f, m_decal->sprite->height / 2.0f }, {parent_scale.x, parent_scale.y});
		
		DrawRotatedDecal({ kid_position.x, kid_position.y }, m_kidDecal, kid_rotation.z, { m_kidDecal->sprite->width / 2.0f, m_kidDecal->sprite->height / 2.0f }, {kid_scale.x, kid_scale.y});


		DrawStringDecal(olc::vf2d(1, 1), "FPS: " + std::to_string(fElapsedTime));

		return true;
	}

	olc::TransformedView m_tv;
	olc::Sprite* m_sprite;
	olc::Decal* m_decal;

	olc::Sprite* m_kidSprite;
	olc::Decal* m_kidDecal;

	Vec2 position = {0.0f, 0.0f};
	Vec2 scale = {0.5f, 0.5f};
	float rotation = 1.0f;

	Vec2 m_position;
	float m_rotation = 30.0f;

};


int main()
{
	Example demo;
	if (demo.Construct(720, 648, 1, 1))
		demo.Start();

	return 0;
}