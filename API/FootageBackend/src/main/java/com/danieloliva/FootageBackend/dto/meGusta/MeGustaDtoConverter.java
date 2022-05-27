package com.danieloliva.FootageBackend.dto.meGusta;

import com.danieloliva.FootageBackend.model.MeGusta;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MeGustaDtoConverter {

    public GetMeGustaDto getMeGustaDto (MeGusta meGusta) {

        return GetMeGustaDto.builder()
                .meGustaPk(meGusta.getId())
                .build();

    }

}
