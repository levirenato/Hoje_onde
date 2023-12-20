import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { ApiBody } from '@nestjs/swagger';
import { AuthDto } from './dto/auth.dto';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService) {}
    @ApiBody({type:AuthDto})
    @Post('login')
    login(@Body() authDto: AuthDto){
        return this.authService.login(authDto)
    }
}
