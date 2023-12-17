function love.load()
    plane = {
        {x = 0, y = 0, z = 0},
        {x = 1, y = 0, z = 0},
        {x = 1, y = 1, z = 0},
        {x = 0, y = 1, z = 0},
        {x = 0, y = 0, z = 0},
    }
    camera = {
        pos = {x = 200 ,y = 200 ,z = -5},
        fov = 90,
    }
end

function get_prospective_pos_x(vec3d,cam)
    Px = (vec3d.x * cam.fov) / (cam.fov + vec3d.z)
    return Px
end

function get_prospective_ScaleX(vec3d,cam)
    PscaleX  = (vec3d.z * cam.fov)
end

function draw_plane(PLANE)
    love.graphics.line(
        camera.pos.x + get_prospective_pos_x(PLANE[1],camera) * 50,
        PLANE[1].y * 50,

        camera.pos.x + get_prospective_pos_x(PLANE[2],camera) * 50,
        PLANE[2].y * 50
    )

    love.graphics.line(
        camera.pos.x + get_prospective_pos_x(PLANE[2],camera) * 50,
        PLANE[2].y * 50,

        camera.pos.x + get_prospective_pos_x(PLANE[3],camera) * 50,
        PLANE[3].y * 50
    )

    love.graphics.line(
        camera.pos.x + get_prospective_pos_x(PLANE[3],camera) * 50,
        PLANE[3].y * 50,

        camera.pos.x + get_prospective_pos_x(PLANE[4],camera) * 50,
        PLANE[4].y * 50
    )
    love.graphics.line(
        camera.pos.x + get_prospective_pos_x(PLANE[4],camera) * 50,
        PLANE[4].y * 50,

        camera.pos.x + get_prospective_pos_x(PLANE[5],camera) * 50,
        PLANE[5].y * 50
    )
end

function love.draw()
    camera.pos.z = camera.pos.z + love.timer.getDelta()
    draw_plane(plane)
end